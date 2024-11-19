#Chuong trinh: De2
	#.include "macro.mac"
#Data segment
	.data
#Cac dinh nghia bien
filename: .asciiz  "FLOAT2.BIN"
buffer: .space 4			# Cung cấp buffer để đọc dữ liệu từ file
fdescr: .word 0			# Lưu trữ file descriptor
float1: .float 1.25 		# Số thực thứ 1
float2: .float 2.0 		# Số thực thứ 2
#Cac cau nhac nhap du lieu
xuat_f1: .asciiz "So thuc thu nhat la: "
xuat_f2: .asciiz "So thuc thu hai la: "
xuat_ket_qua: .asciiz "Tong hai so thuc la: "
line_break: .asciiz "/n"
str_loi: .asciiz "Sai"
#Code segment
	.text
main:
#Mở file
	la $a0, filename			# Đưa địa chỉ filename vào $a0
	addi $a1, $zero, 0		# Chế độ đọc
	addi $a2, $zero, 2 		# Chế độ đọc-ghi
	addi $v0, $zero, 13		# Syscall 13: Open file
	syscall				# Thực hiện syscall mở file
	bgez $v0, tiep
bao_loi:
	la $a0, str_loi
	addi $v0, $zero, 4
	syscall
	li $v0, 1                 		# Syscall 1: Print integer (Xem mã lỗi)
	move $a0, $v0             	# Đưa kết quả mở file vào $a0 để in
	syscall
	j Kthuc
tiep:	sw $v0, fdescr			# Lưu file descriptor
#Đọc file
#Đọc số thực thứ 1
	lw $a0, fdescr			# Load file descriptor
	la $a1, buffer			# lấy địa chỉ buffer
	li $a2, 4				# Đọc tối đa 4 byte
	li $v0, 14				# Syscall 14: Read file
	syscall

# Kiểm tra giá trị trong buffer
	lw $s1, buffer       # Đưa dữ liệu từ buffer vào $s1
	mtc1 $s1, $f12       # Chuyển giá trị từ $s1 vào $f12 để in ra
	li $v0, 2            # Syscall 2: Print float
	syscall


# Đóng file
	lw $a0, fdescr			#Load file descriptor
    	li $v0, 16         			# Syscall 16: Close file
    	syscall            			# Thực hiện syscall để đóng file

#In ra số thực thứ 1
	lw $s1, buffer            	# Đưa dữ liệu từ buffer vào $s1
	mtc1 $s1, $f12       		# Di chuyển dữ liệu từ $s1 vào $f12 để in ra
	li $v0, 2           			# Syscall 2: Print float	
	syscall             			# Thực hiện syscall để in

#Nhap (syscall)
#Xu ly
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc:	addi	$v0,$zero,10
	syscall
# -------------------------------	
# Cac chuong trinh khac
# -------------------------------

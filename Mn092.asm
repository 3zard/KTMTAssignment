#Chuong trinh: De2
	#.include "macro.mac"
#Data segment
	.data
#Cac dinh nghia bien
filename: .asciiz  "FLOAT2.BIN"
buffer: .word 0			# Cung cấp buffer để đọc dữ liệu từ file
file_descriptor: .word 0	# Lưu trữ file descriptor
float1: .word 0x3F800000 # Số thực thứ 1
float2: .word 0x40000000 # Số thực thứ 2
#Cac cau nhac nhap du lieu
xuat_f1: .asciiz "So thuc thu nhat la: "
xuat_f2: .asciiz "So thuc thu hai la: "
xuat_ket_qua: .asciiz "Tong hai so thuc la: "
line_break: .asciiz "/n"
#Code segment
	.text
main:
#Mở file
	la $t1, buffer	
	li $v0, 13			# Syscall 13: Open file
	la $a0, filename		# Đưa địa chỉ filename vào $a0
	li $a1, 0			# Chế độ đọc
	li $a2, 2			# Chế độ đọc-ghi
	syscall			# Thực hiện syscall mở file

# Lưu file descriptor vào file_descriptor
	move $s0, $v0      	# Lưu kết quả trả về vào $s0
	
#Đọc file
#Đọc số thực thứ 1
	li $v0, 14				# Syscall 14: Read file
	move $a0, $s0			# Sử dụng file descriptor đã mở
	la $a1, 0($t1)			# Địa chỉ buffer để lưu dữ liệu đọc được
	li $a2, 4				# Đọc tối đa 4 byte
	syscall				# Thực hiện syscall đọc file
	lw $s1, 0($t1)

#In ra số thực thứ 1
	li $v0, 1           # Syscall 1: Print integer
	move $a0, $s1       # Di chuyển dữ liệu từ $s1 vào $a0 để in ra
	syscall             # Thực hiện syscall để in

# Đóng file
    li $v0, 16         # Syscall 16: Close file
    move $a0, $s0      # Sử dụng file descriptor đã mở
    syscall            # Thực hiện syscall để đóng file

#Nhap (syscall)
#Xu ly
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc:	addi	$v0,$zero,10
	syscall
# -------------------------------	
# Cac chuong trinh khac
# -------------------------------

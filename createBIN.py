import struct

# Ví dụ hai số thực (có thể thay đổi theo yêu cầu của bạn)
number1 = 1.5
number2 = 2.75

# Mở và tạo file nhị phân FLOAT2.BIN
with open('FLOAT2.BIN', 'wb') as file:
    # Ghi hai số float (4 byte mỗi số) vào file nhị phân
    file.write(struct.pack('ff', number1, number2))

# Mở file nhị phân FLOAT2.BIN và đọc dữ liệu
with open('FLOAT2.BIN', 'rb') as file:
    data = file.read()

# In ra các byte đọc được
print(list(data))  # In ra các byte của file
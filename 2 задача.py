a = int(input("введите первое число:"))
b = int(input("введите второе число:"))
c = int(input("введите третье число:"))
 
if a > b:
    if a > c:
        print(a)
    else:
        print(c)
else:
    if b > c:
        print(b)
    else:
        print(c)

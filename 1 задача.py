x= int(input("введите год:"))
if (((x % 4 == 0) & (x % 100 > 0))|(x % 400 == 0)):
    print("YES")
else:
    print("NO")


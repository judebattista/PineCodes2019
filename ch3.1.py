def isEven(x):
    return x % 2 == 0

def digitsAllOdd(x):
    strX = str(x)
    for char in strX:
        intChar = int(char)
        if isEven(intChar):
            return False
    return True

count = 0
for ndx in range(10, 10**9):
    #if ndx % 1000 == 0:
        #print(ndx)
    revNstr = str(ndx)[::-1]
    if ndx % 10 == 0:
        pass
    else:
        revN = int(revNstr)
        sumN = revN + ndx
        if digitsAllOdd(sumN):
            #print(ndx, revN, sumN)
            count += 1
print(count)

import collections
import itertools
import math

def numToArray (num):
    return list(str(num))

def numToSet(num):
    return set(str(num))

def constructNumber(numDigits):
    pass

def listEquality(x, y):
    return collections.Counter(str(x)) == collections.Counter(str(y))

#print(listEquality(12341, 12342))
#print(listEquality(12341, 23411))

possible = []
# 16 * 6 does not cause overflow, but 17 * 6 does
# for a given power of ten, n, we need to check the first n/1.66666 values
# do not need to check single digits
radix = 10
while len(possible) < 1:
    upperbound = math.ceil(radix/1.666666)
    print(upperbound)
    for ndx in range(0, upperbound + 1):
        number = radix + ndx
        #print(number)
        if listEquality(number, 2 * number) and  listEquality(number, 3 * number) and listEquality(number, 4 * number) and listEquality(number, 5 * number) and listEquality(number, 6 * number):
            possible.append(number)
    radix *=10
    print(radix)
    #possible.append(1)

print(sorted(possible))

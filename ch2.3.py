import math

def gcf(x, y):
    maxFactor = math.ceil(math.sqrt(x))
    #print(maxFactor)
    maxValid = 1
    for ndx in range(2, maxFactor):
        if x % ndx == 0 and y % ndx == 0:
            maxValid = ndx
    return maxValid

#generate lists of denominators
d = 8
denoms = list(range(1, d+1))
print(denoms)
numes = []
for den in denoms:
    subNumes = list(range(1, den + 1))
    numes.append(subNumes)

print('Length denoms: ', len(denoms))
print('Length numes: ', len(numes))

for foo in range(0, len(denoms)-1):
    for bar in range(0, len(numes[foo])-1):
        print(foo, bar)
        if gcf(numes[foo][bar], denoms[foo]) > 1:
            del numes[foo][bar]
        if len(numes[foo]) < 1:
            del numes[foo]
            del denoms[foo]


count = 0
for ndx in range(0, len(numes)-1):
    count += len(numes[ndx])

print(numes)
print(denoms)
print(count)

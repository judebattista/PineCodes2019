import collections

for exp in range(2, 10):
    total = 0
    for ndx in range(10, 10**exp):
        strNdx = str(ndx)
        #dq = collections.deque(strNdx)
        #dq.rotate(1)
        lastNdx = len(strNdx) - 1
        rotN = strNdx[lastNdx] + strNdx[0:lastNdx]
        #print(strNdx, rotN)
        #rotN = list(dq)
        #rotN = list(collections.deque(str).rotate(1))
        #print(ndx, int(''.join(rotN)))
        intRotn = int(''.join(rotN))
        if intRotn % ndx == 0:
           total += ndx
    print(exp, total)

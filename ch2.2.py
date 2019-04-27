import math

def choose(n, r):
    result = float(math.factorial(n)) / (float(math.factorial(r))*(float(math.factorial(n - r))))
    return result

n = 5
sum2 = 0
length2 = 2
for ndx in range(math.floor(n/length2), 0, -1):
    sum2 += choose(n, n - ndx*2)

sum3 = 0
length3 = 3
for ndx in range(math.floor(n/length3), 0, -1):
    sum3 += choose(n, n - ndx*3)

sum4 = 0
length4 = 4
for ndx in range(math.floor(n/length4), 0, -1):
    sum4 += choose(n, n - ndx*4)

print(sum2, sum3, sum4, sum2 + sum3 + sum4)
import numpy as np
import matplotlib.pyplot as plt
import time

n = np.zeros((10**6), dtype=np.float32)
nu = np.zeros((10**6), dtype=np.float64)
for i in range(10**6):
	n[i] = 1 + (10**6 + 1 - (i+1)) * 10**(-8)
	nu[i] = 1 + (10**6 + 1 - (i+1)) * 10**(-8)

## naive summation
# single precision

start = time.time()
c = 0
for i in range(10**6):
	c = c + n[i]
end = time.time()
print("Naive summation of the elements of nums with single precision is :", c)
print("The absolute error of naive summation with single precision is :", abs(1005000.005 - c))
print("The time of execution of single precision naive summation is :", (end-start) * 10**3, "ms")
print()

# double precision

start1 = time.time()
cu = 0
for i in range(10**6):
	cu = cu + nu[i]
end1 = time.time()
print("Naive summation of the elements of nums with double precision is :", cu)
print("The absolute error of naive summation with double precision is :", abs(1005000.005 - cu))
print("The time of execution of double precision naive summation is :", (end1-start1) * 10**3, "ms")
print()


## compensated summation
# single precision

start2 = time.time()
s = 0
k = 0
for i in range(10**6):
	temp = s
	y = k + n[i]
	s = temp + y
	k = (temp - s) + y
end2 = time.time()
print("Compensated summation of the elements of nums with single precision is :", s)
print("The absolute error of compensated summation with single precision is :", abs(1005000.005 - s))
print("The time of execution of single precision compensated summation is :", (end2-start2) * 10**3, "ms")
print()

# double precision

start3 = time.time()
s1 = 0
k1 = 0
for i in range(10**6):
	temp = s1
	y = k1 + nu[i]
	s1 = temp + y
	k1 = (temp - s1) + y
end3 = time.time()
print("Compensated summation of the elements of nums with double precision is :", s1)
print("The absolute error of compensated summation with double precision is :", abs(1005000.005 - s1))
print("The time of execution of double precision compensated summation is :", (end3-start3) * 10**3, "ms")
print()
print()
print("These 2 values below are for the pairwise summation where the partitions have at most 1000 elements: ")
print()

## pairwise summation
# single precision

def pairwise(n1, s, e):
	if (e - s + 1) <= 1000:
		c = 0
		for i in range(s, e+1):
			c = c + n1[i]
	else:
		m = int(np.floor(s + (e-s)/2))
		c = pairwise(n1, s, m) + pairwise(n1, m+1, e)
	return c

def pairwise2(n1, s, e):
	if (e - s + 1) <= 10000:
		c = 0
		for i in range(s, e+1):
			c = c + n1[i]
	else:
		m = int(np.floor(s + (e-s)/2))
		c = pairwise2(n1, s, m) + pairwise2(n1, m+1, e)
	return c

start4 = time.time()
single_total = pairwise(n, 0, 10**6 - 1)
end4 = time.time()
print("Pairwise summation of the elements of nums with single precision is :", single_total)
print("The absolute error of pairwise summation with single precision is :", abs(1005000.005 - single_total))
print("The time of execution of single precision pairwise summation is :", (end4-start4) * 10**3, "ms")
print()

# double precision 

start5 = time.time()
double_total = pairwise(nu, 0, 10**6 - 1)
end5 = time.time()
print("Pairwise summation of the elements of nums with double precision is :", double_total)
print("The absolute error of pairwise summation with double precision is :", abs(1005000.005 - double_total))
print("The time of execution of double precision pairwise summation is :", (end5-start5) * 10**3, "ms")
print()
print("These 2 values below are for the pairwise summation where the partitions have at most 10000 elements: ")
print()

# single precision

start6 = time.time()
single_t = pairwise2(n, 0, 10**6 - 1)
end6 = time.time()
print("Pairwise summation of the elements of nums with single precision is :", single_t)
print("The absolute error of pairwise summation with single precision is :", abs(1005000.005 - single_t))
print("The time of execution of single precision pairwise summation is :", (end6-start6) * 10**3, "ms")
print()

# double precision

start7 = time.time()
double_t = pairwise2(nu, 0, 10**6 - 1)
end7 = time.time()
print("Pairwise summation of the elements of nums with double precision is :", double_t)
print("The absolute error of pairwise summation with double precision is :", abs(1005000.005 - double_t))
print("The time of execution of double precision pairwise summation is :", (end7-start7) * 10**3, "ms")
print()

e = np.finfo(np.float64).eps
x = np.linspace(1,1000,1000)
g = ((x*(((x+1)/x)-1))-1)/e

#a = [0]
a = np.zeros((1001), dtype=np.float64)
print("These are the n values where g(n) = 0 :")
for i in range(1, 1001):
#	a.append(((i*(((i+1)/i)-1))-1)/e)
	a[i] = ((i*(((i+1)/i)-1))-1)/e
	if a[i] == 0:
		print(i)

plt.stem(x, g)
plt.show()
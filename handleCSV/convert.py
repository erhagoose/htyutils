import numpy as np
a = np.ndarray((5000, 20))

for i in range(20):
    print(f'getting {i}')
    dt = np.zeros((10, 5000))
    for j in range(50):
        num = i * 50  + j + 1
        dt += np.loadtxt(f'data/ts_noise_{num}.csv', delimiter=',', skiprows=1, usecols=range(1, 5001))
    dt /= 50
    a[:, i] = np.linalg.norm(dt, axis=0)

np.savetxt('data/result.csv', a, delimiter=',')

import numpy as np
import matplotlib.pyplot as plt
import math


def Q1_f_n(n: float) -> float:
    return (n*(((n+1)/n)-1))-1


def Q1_g_n(n: float) -> float:
    return Q1_f_n(n)/np.finfo(float).eps


def Q1_plot(n1: int, n2: int):
    xPoints = []
    yPoints = []
    zero_values = []
    for x in range(n1, n2 + 1):
        xPoints.append(x)
        gn = Q1_g_n(x)
        yPoints.append(gn)
        if gn == 0:
            zero_values.append(x)

    xArray = np.array(xPoints)
    yArray = np.array(yPoints)
    print(f"g(n) = 0 for {zero_values}")
    plt.plot(xArray, yArray)
    plt.xlabel('n')
    plt.ylabel('g(n)')
    plt.title('g(n) = f(n)/ε, n ∈ [1, 1000] ')
    plt.show()


def Q2_nums_n_single(n) -> np.single:
    return np.single(np.single(1.0) + np.single(np.single(10**6) + np.single(1.0) - np.single(n))*np.single(10**-8))


def Q2_nums_n_double(n) -> np.double:
    return np.double(np.double(1.0) + np.double(np.double(10**6) + np.double(1.0) - np.double(n))*np.double(10**-8))


def Q2_generate_nums_single(n1, n2) -> list[np.single]:
    nums: list[np.single] = []

    for n in range(n1, n2+1):
        nums.append((Q2_nums_n_single(n)))
    return nums


def Q2_generate_nums_double(n1, n2) -> list[np.double]:
    nums: list[np.double] = []

    for n in range(n1, n2+1):
        nums.append((Q2_nums_n_double(n)))
    return nums


def Q2_naive_sum_single(nums: list[np.single]) -> np.single:
    retVal = np.single(0)
    for x in nums:
        retVal += x
    return retVal


def Q2_naive_sum_double(nums: list[np.double]) -> np.double:
    retVal = np.double(0)
    for x in nums:
        retVal += x
    return retVal


def Q2_pairwise_sum_single(nums: list[np.single]) -> np.single:
    length = len(nums)
    divider = math.floor(float(length)/2.0)
    if length <= 2:
        retVal = np.single(0)
        for x in range(0, length):
            retVal += nums[x]
        return retVal
    else:
        return np.single(Q2_pairwise_sum_single(nums[0:divider]) + Q2_pairwise_sum_single(nums[divider:length]))


def Q2_pairwise_sum_double(nums: list[np.double]) -> np.double:
    length = len(nums)
    divider = math.floor(float(length)/2.0)
    if length <= 2:
        retVal = np.double(0)
        for x in range(0, length):
            retVal += nums[x]
        return retVal
    else:
        return np.double(Q2_pairwise_sum_double(nums[0:divider]) + Q2_pairwise_sum_double(nums[divider:length]))


def Q2_compensated_sum_single(nums: list[np.single]) -> np.single:
    retVal = np.single(0)
    compensation = np.single(0)
    for x in range(0, len(nums)):
        y = np.single(nums[x] - compensation)
        t = np.single(retVal + y)
        compensation = np.single(t - retVal - y)
        retVal = np.single(t)
    return retVal


def Q2_compensated_sum_double(nums: list[np.double]) -> np.double:
    retVal = np.double(0)
    compensation = np.double(0)
    for x in range(0, len(nums)):
        y = np.double(nums[x] - compensation)
        t = np.double(retVal + y)
        compensation = np.double(t - retVal - y)
        retVal = np.double(t)
    return retVal


def Q2_generate_results(n1, n2):
    nums_single = Q2_generate_nums_single(n1, n2)
    nums_double = Q2_generate_nums_double(n1, n2)
    print(f"Naive Sum\n"
          f"Single Precision:\t{Q2_naive_sum_single(nums_single)}\t"
          f"Double Precision:\t{Q2_naive_sum_double(nums_double)}\n"
          f"Pairwise Sum\n"
          f"Single Precision:\t{Q2_pairwise_sum_single(nums_single)}\t"
          f"Double Precision:\t{Q2_pairwise_sum_double(nums_double)}\n"
          f"Compensated Sum\n"
          f"Single Precision:\t{Q2_compensated_sum_single(nums_single)}\t"
          f"Double Precision:\t{Q2_compensated_sum_double(nums_double)}")


# Q1_plot(1, 1000) # Stops the program until interactive window is closed, because of that, I commented it out.
Q2_generate_results(1, 10**6)

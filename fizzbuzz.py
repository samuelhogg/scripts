# https://www.hackerrank.com/challenges/fizzbuzz/problem

# Python 3
i=1
while i <= 100:
    if i%3==0:
        print("Fizz", end="")
        if i%5==0:
            print("Buzz", end="")
    elif i%5==0:
        print("Buzz", end="")
    else:
        print(i, end="")
    print()
    i+=1
    
/*
# Python 2
for i in range(101):
    if i==0:
        continue
    elif i%15==0:
        print 'FizzBuzz'
    elif i%5==0:
        print 'Buzz'
    elif i%3==0:
        print 'Fizz'
    else:
        print i
*/
    

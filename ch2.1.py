import inflect
import re

words = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six'
}

ints = list(range(1,1001))
#print(ints)
converter = inflect.engine()

letterCount = 0
for val in ints:
    strVal = str(val)
    radix = 1
    print(strVal)
    if val % 100 > 10 and val % 100 < 20:
        pass
    else:
        for digit in strVal[::-1]:
            if int(digit) > 0:
                placeValue = int(digit) * radix
                wordValue = converter.number_to_words(placeValue)
                parsedWord = wordValue.replace('-', '')
                parsedWord = parsedWord.replace(' ', '')
                print(parsedWord)
                letterCount += len(parsedWord)
            radix *= 10
print('Without ands or teens: ', letterCount)
# handle teens: 
letterCount += (6 + 6 + 8 + 8 + 7 + 7 + 9 + 8 + 8) * 10
# handle hundreds for teens
letterCount += 7 * 9 * 10
print(letterCount)

# handle ands
# should be one and per hundred EXCEPT for 100, 200, 300, 400, 500, 600, 700, 800, 900
# so there should be 900  - 9 = 891 ands
letterCount += 3 * 891
print('With ands: ', letterCount)
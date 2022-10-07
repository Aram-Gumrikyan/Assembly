#include "iostream"
using namespace std;

int main()
{
  short numbers[] = {72, 82, 42, 62, 52, 10};
  const short numbersLength = sizeof(numbers) / sizeof(numbers[0]);

  short minNumber = numbers[0];

  for (int i = 1; i < numbersLength; i++)
  {
    if (numbers[i] < minNumber)
    {
      minNumber = numbers[i];
    }
  }

  /**
   *
   * we are reversing index of values, not some values;
   * reverseBits, mirror reverse consider to center of number bits
   *
   * */
  short reversedMinNumber = 0;
  short bitsCount = sizeof(minNumber) * 8;
  for (int i = 0; i < bitsCount; i++)
  {
    short reversibleBite = (minNumber >> i) & 1;
    short reversedBite = reversibleBite << (bitsCount - i - 1);
    reversedMinNumber |= reversedBite;
  }

  cout << "minNumber is: " << minNumber << endl;
  cout << "Bit reversed minNumber is: " << reversedMinNumber << endl;
  return 0;
}

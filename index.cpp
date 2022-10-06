#include "iostream"
using namespace std;

int main()
{
  int numbers[] = {7, 0, -4, 6, 5};
  const int numbersLength = sizeof(numbers) / sizeof(numbers[0]);

  int minNumber = numbers[0];

  for (int i = 1; i < numbersLength; i++)
  {
    if (numbers[i] < minNumber)
    {
      minNumber = numbers[i];
    }
  }

  cout << "Bit changed minNumber is: " << ~minNumber << endl;
  return 0;
}

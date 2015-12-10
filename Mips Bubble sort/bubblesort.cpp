#include <iostream>
using namespace std;

int main() {

	int arr[100], num, y, z, swap;

	cout << "how many numbers will you enter?" << endl;
	cin >> num;

	//Store numbers into arr
	for (int i = 0; i < num; i++) {
		cout << "enter number: " << i + 1 << endl;
		cin >> arr[i];
	}

	cout << endl;
	cout << "Orignal array is: " << endl;

	// Print out original Array
	for (int j = 0; j<num; j++)
	{
		cout << arr[j] << " ";
	} 

	cout << endl;


	//Sort
	for (int i = 0; i<num-1; i++)
	{
		for (int j = 0; j<num-1; j++)
		{
			if (arr[j]>arr[j + 1])
			{
				swap = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = swap;
			}
		}
	}

    
	//Print out sorted array once
	cout << "Sorted Array is: " << endl;
	for (int i = 0; i<5; i++)
	{
		cout << arr[i] << " ";
	}

	cout << endl;

	return 0;
}
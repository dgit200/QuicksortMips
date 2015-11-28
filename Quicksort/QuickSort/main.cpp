#include <iostream>

using namespace std;

void quickSort(int list[], int start, int end);
int main()
{
	int arr[] = { 1, 12, 5, 26, 7, 14, 3, 7, 2 };
	cout << "The lis is: \n";
	for (int i = 0; i < 9; i++)
	{
		cout << arr[i] << ", ";
	}
	cout << "\n";
	quickSort(arr, 0, 8);
	cout << "The sorted list is: \n";
	for (int i = 0; i < 9; i++)
	{
		cout << arr[i] << ", ";
	}
	cout << "\n";
	system("pause");
	return 0;
}

void quickSort(int list[], int start, int end)
{
	int a = start, b = end;
	int swap_temp;
	int pivot = list[(a + b) / 2];
	while (a <= b) {
		while (list[a] < pivot)
			a++;
		while (list[b] > pivot)
			b--;
		if (a <= b) {
			swap_temp = list[a];
			list[a] = list[b];
			list[b] = swap_temp;
			a++;
			b--;
		}
	};
	if (start < b)
		quickSort(list, start, b);
	if (a < end)
		quickSort(list, a, end);
}
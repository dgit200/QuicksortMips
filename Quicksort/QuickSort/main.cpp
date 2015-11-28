#include <iostream>

using namespace std;
//Declaring the quicksort function
void quickSort(int list[], int start, int end);

int main()
{//The main where the code is run. This is used to test the quicksort function.
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
{//This is the quicksort function defined.
	//Setting up the varibales to used in the function
	int a = start, b = end;
	int swap_temp;
	int pivot = list[(a + b) / 2];
	//Do the partition of the array about the pivot(dividing the list into a lower list and upper list to be futher sorted.
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
	//Calling the quicksort function recursivily to futher sort the partitions.
	//This recursion is called to sort the lower partition
	if (start < b)
		quickSort(list, start, b);
	//This recursion is called to sort the upper partition
	if (a < end)
		quickSort(list, a, end);
}
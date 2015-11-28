#include <iostream>

using namespace std;

void quickSort(int list[], int start, int end);
int main()
{
	
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
}
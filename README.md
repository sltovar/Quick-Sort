QUICK-SORT
This program takes a list of numbers as input and returns a list of the numbers in ascending order by using the quick sort algorithm and dividing the lists based upon the average value of a list.

STEPS:
Average: Add all the numbers of a list, divide by the numbers

This is a recursive function, where you figure out the average number of the list, divide the list into two lists
(numbers that are less than that number, numbers that are greater than that number), and keep doing that until you end up with either lists that have one number in them or ones that are empty lists. You then 'append' all of the results together. The appended results will be in ascending order.

Create 2 new lists with the group of numbers that are less than the average, and the numbers that are greater than the average. Get the average of the first half of the list. Next, step through the list and create 2 new lists again the numbers that are less than that second average and the numbers that are greater than that second average and so on and so on...

EXAMPLE/EXPLAINATIONS:
Appending recursive version of one and the other
Example: Two halves, a and b
Next, append (qsort a) (qsort b)
Handy to have a function that you give it a list and a number and it just creates a list of all the numbers that are less than the input number. Let's say you had a function that calculated the smaller half, and one that calculated the larger half. Then you'd have something like:
(append (qsort (smallerhalf inlist)) (qsort (largerhalf inlist)))
Leaving out details, but that's the idea

We go all the way down sorting list into greater and less than compared to each localized list's average until the list is short, say 1, then recursively append on the way out.

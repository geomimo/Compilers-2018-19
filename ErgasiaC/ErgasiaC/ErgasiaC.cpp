// ErgasiaC.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <string>
#include <list>
using namespace std;

int main()
{
	char ans = 'y';
	while (ans == 'y') {
		cout << "Please give an expression to analyse." << endl;
		string inputText;
		cin >> inputText;
		list<char> input;
		for (int i = 0; i < inputText.length(); i++) {
			input.push_back(inputText[i]);
		}
		input.push_back('$');
		list<char> stack;
		stack.push_back('$');
		stack.push_back('S');
		int j = 0;
		bool wrong = false;
		while (input.size()>1 && stack.size()>1) {
			if (stack.back() == 'S') {
				stack.pop_back();
				stack.push_back(']');
				stack.push_back('A');
				stack.push_back('[');
			}
			else if (stack.back() == 'A') {
				stack.pop_back();
				stack.push_back('E');
				stack.push_back('B');
			}
			else if (stack.back() == 'B') {
				stack.pop_back();
				if (input.front() == '[') {
					stack.push_back('S');
				}
				else if (input.front() == 'x') {
					stack.push_back('x');
				}
				else if (input.front() == 'y') {
					stack.push_back('y');
				}
				else {
					cout << "Expression was not recognized!" << endl;
					wrong = true;
					break;
				}
			}
			else if (stack.back() == 'E') {
				stack.pop_back();
				if (input.front() == ':') {
					stack.push_back('A');
					stack.push_back(':');
				}
				else if (input.front() == '+') {
					stack.push_back('A');
					stack.push_back('+');
				}
				else if (input.front() == ']') {
					;
				}
				else {
					cout << "Expression was not recognized!" << endl;
					wrong = true;
					break;
				}
			}
			else if (stack.back() == input.front()) {
				input.pop_front();
				stack.pop_back();
			}
			
			for (list<char>::iterator i = stack.begin(); i != stack.end(); ++i)
				cout << *i;
			cout << "\t\t";
			for (list<char>::iterator i = input.begin(); i != input.end(); ++i)
				cout << *i;
			cout << endl;
			j++;
		}
		if (!wrong) {
			if (stack.back() == '$' && stack.back() == input.front()) {
				cout << "Expression was successfully recognized!" << endl;
			}
			else {
				cout << "Expression was not recognized!" << endl;
			}
		}
		cout << endl;
		cout << "Would you like to repeat? [y/n]" << endl;
		cin >> ans;
	}

	return 0;
}


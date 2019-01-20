// ErgasiaA.cpp : This file contains the 'main' function. Program execution begins and ends there.


#include "pch.h"
#include <iostream>
#include <stack>
#include <fstream>
#include <string>
using namespace std;

bool stackAutomata(string &state, char input, stack<char> &myStack, bool verbose) {
	if (state == "k1" && input == '(') {
		myStack.push('X');
		if (verbose) {
			cout << "Push in stack." << endl;
		}
	}
	else if (state == "k1" && input == ')' && myStack.top() == 'X') {
		myStack.pop();
		if (verbose) {
			cout << "Pop from stack." << endl;
		}
	}
	else if (state == "k1" && input == ')' && myStack.top() == '$') {
		return false;
	}
	else if (state == "k1" && input == '\0' && myStack.top() == 'X') {
		return false;
	}
	else {
		state = "k2";
	}
	return true;
}

int main(int argc, char* argv[])
{
	cout << "Please give the name of file to analyze." << endl;
	string foo;
	cin >> foo;
	ifstream file(foo);
	string text, input;
	if (file.is_open()) {
		string line;
		while (getline(file, line)) {
			text += line;
		}
	}
	else {
		cout << "Unable to open file." << endl;
		char c;
		cin >> c;
		return 0;
	}
	for (auto i = 0; i < text.length(); i++) {
		if (text[i] == '(' || text[i] == ')') {
			input += text[i];
		}
	}

	char flag;
	do {
		cout << "Print step? Press Y/N." << endl;
		cin >> flag;
	} while (flag != 'Y' && flag != 'N');
	bool verbose = flag == 'Y';
	stack<char> myStack;
	myStack.push('$');
	string state = "k1";
	bool result;
	cout << "Input: " << input << endl;
	for (auto i = 0; i < input.length()+1; i++) {
		if (verbose) {
			cout << endl;
			cout << "State: " << state << endl
				<< "Input: ";
			for (int j = i; j < input.length() + 1; j++) {
				cout << input[j];					
			}
			cout << endl
					<< "Stack: ";
			stack<char> temp = myStack;
			while (!temp.empty()) {
				cout << temp.top();
				temp.pop();
			}
			cout << endl; 
					
		}
		result = stackAutomata(state, input[i], myStack, verbose);
		if (!result) break;
	}

	if (result && state=="k2") {
		cout << endl << "*****TRUE*****" << endl << endl;
	}
	else {
		cout << endl << "*****FALSE*****" << endl << endl;			
	}
				
	
	cout << "Press any key to continue." << endl;
	char c;
	cin >> c;
	return 0;
}


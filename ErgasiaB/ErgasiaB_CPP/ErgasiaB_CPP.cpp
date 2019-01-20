// ErgasiaB_CPP.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <string>
#include <regex>
#include <vector>
#include <time.h>

using namespace std;



vector<string> chooseRule(string token) {
	vector<string> vct;
	if (token == "<expression>") {
		vct.push_back("<term>");
		vct.push_back("<expression>+<term>");
	}
	else if (token == "<term>") {
		vct.push_back("<factor>");
		vct.push_back("<term>*<factor>");
	}
	else {
		vct.push_back("a");
		vct.push_back("b");
		vct.push_back("c");
	}
	return vct;
}

int main()
{
	srand(time(NULL));

	char ans;
	regex e("^.*<expression>|<term>|<factor>");
	smatch m;
	do {
		string str = "<expression>", token = "<expression>", production = "";
		int loops = 1;
		while (loops < 100 && token != ""){
			vector<string> rule = chooseRule(token);
			production = rule[rand() % rule.size()];
			cout << loops << ")\t" << str << "\t(" << token << " => " << production << ")" << endl;
			int pos = str.find(token);
			str.replace(pos, token.length(), production);
			regex_replace(token, e, production);	
			regex_search(str, m, e);
			token = m.str(0);
			loops++;
		}
		if (loops == 100) {
			cout << "Too many loops." << endl;
		}
		else {
			cout << loops << ")\t" << str << endl
				 << "Would you like to repeat? [y/n]" << endl;
			cin >> ans;
			cout << endl;
		}
	} while (ans != 'n');
}


#include <iostream>
#include <fstream>
#include <string>

int main(int argc, char *argv[])
{
	std::ofstream outfile("configure.txt");
	outfile << "123";
	
	std::ifstream infile("123.txt");
	if(!infile.is_open())
	{
		std::ofstream outfile("123.txt");
		outfile << "create";
		outfile.close();
	}
//	outfile << "123";
	return 0;
}

p05:

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <cstring>

using namespace std;

class variable
{

struct student
{
char usn[11],name[15],sem[10],dept[15];
};
public:
void add();
void search();
void delete1();
void setup();
};
void variable::setup()
{
ofstream out1,out2;
out1.open("index.txt",ios::in|ios::trunc);
out2.open("student5.txt",ios::in|ios::trunc);
out1.close();
out2.close();
}
void variable::add()
{
char buffer[100],temp[50],usn[11],temp1[50];
int pos1,flag=0;
student s;
ifstream out2;
out2.open("index.txt",ios::in);
cout<<"\nEnter usn,name,sem,dept :";
cin>>s.usn>>s.name>>s.sem>>s.dept;
while(!out2.eof())
{
out2.getline(temp,50,'$');
sscanf(temp,"%[^|]|%d|$",usn,&pos1);
if(strcmp(s.usn,usn)==0)
{
flag=1;
break;
}
}
out2.close();
if(flag==1)
cout<<"\nPrimary key constraint violation,record not inserted";
else
{
ofstream out1,out2;
out1.open("student5.txt",ios::app);
out2.open("index.txt",ios::app);
out1.seekp(0,ios::end);
long pos=out1.tellp();
sprintf(buffer,"%s|%s|%s|%s|$",s.usn,s.name,s.sem,s.dept);
out1<<buffer;
sprintf(temp1,"%s|%ld|$",s.usn,pos);
out2<<temp1;
out1.close();
out2.close();
}
}
void variable::search()
{
char buffer[100],temp[50],usn[11],usn1[11];
int pos,flag=0;
student s;
cout<<"\nEnter usn to be searched";
cin>>usn;
ifstream out1,out2;
out2.open("index.txt",ios::in);
while(!out2.eof())
{
out2.getline(temp,50,'$');
sscanf(temp,"%[^|]|%d|$",usn1,&pos);
if(strcmp(usn1,usn)==0)
{
out1.open("student5.txt",ios::out);
out1.seekg(pos,ios::beg);
out1.getline(buffer,100,'$');
sscanf(buffer,"%[^|]|%[^|]|%[^|]|%[^|]|$",s.usn,s.name,s.sem,s.dept);
cout<<"\nRecord found";
flag=1;
cout<<endl<<s.usn<<" "<<s.name<<" "<<s.sem<<" "<<s.dept;
break;
}
}
if(flag==0)
cout<<"\nRecord doesn't exist";
out1.close();
out2.close();
}
void variable::delete1()
{
char buffer[100],temp[50],usn[11],usn1[11];
int pos,flag=0;
student s;
cout<<"\nEnter usn to be deleted:";
cin>>usn;
ifstream in1,in2;
ofstream of1,of2;
in1.open("index.txt",ios::in);
in2.open("student5.txt",ios::in);
of1.open("index2.txt",ios::out);
of2.open("stud51.txt",ios::out);
while(1)
{
in1.getline(temp,50,'$');
if(in1.eof())
break;
in2.getline(buffer,100,'$');
sscanf(temp,"%[^|]|%d|$",usn1,&pos);
strcat(buffer,"$");
strcat(temp,"$");
int len=strlen(buffer);
if(strcmp(usn,usn1)!=0)
{
of1<<temp;
of2<<buffer;
}
else
{
flag=1;
for(int i=0;i<len;i++)
buffer[i]='*';
of2<<buffer;
}
}
if(flag)
cout<<"\nRecord deleted";
else
cout<<"\nRecord doesn't exists";
in1.close();
in2.close();
of1.close();
of2.close();
remove("index.txt");
remove("student5.txt");
rename("index2.txt","index.txt");
rename("stud51.txt","student5.txt");
}
int main()
{
int ch;
variable v;
v.setup();
for( ; ; )
{
cout<<"\n1:add 2:Search 3:delete 4:exit";
cout<<"\nenter the choice :";
cin>>ch;
switch(ch)
{
case 1:v.add(); break;
case 2:v.search(); break;
case 3:v.delete1(); break;
default:exit(0);
}
}
return 0;
}


p06:

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <cstring>

using namespace std;

class variable
{
struct student
{
char usn[11],name[15],sem[10],dept[15],n;
};
public:
void add();
void search();
void delete1();
void setup();
};

void variable::setup()
{
ofstream out1,out2;
out1.open("index6.txt",ios::out | ios::trunc);
out2.open("student6.txt",ios::out | ios::trunc);
out1.close();
out2.close();
}
void variable::add()
{
char buffer[100],temp[50],usn[11],temp1[50],name[15];
int pos1,flag=0;
student s;
s.n=0;
ifstream out2;
out2.open("index6.txt",ios::out);
cout<<"\nEnter usn,name,sem,dept:";
cin>>s.usn>>s.name>>s.sem>>s.dept;
while(!out2.eof())
{
out2.getline(temp,50,'$');
sscanf(temp,"%[^|]|%[^|]|%d|$",usn,name,&pos1);
if(strcmp(s.usn,usn)==0)
{
flag=1;
break;
}
}
out2.close();
if(flag==1)
cout<<"\nPrimary key constraints violation,record not inserted";
else
{
ofstream out1,out2;
out1.open("student6.txt",ios::app);
out2.open("index6.txt",ios::app);
out1.seekp(0,ios::end);
long pos=out1.tellp();
sprintf(buffer,"%s|%s|%s|%s|$",s.usn,s.name,s.sem,s.dept);
out1.write(buffer,strlen(buffer));
sprintf(temp1,"%s|%s|%ld|$",s.usn,s.name,pos);
out2<<temp1;
s.n++;
out1.close();
out2.close();
}
}

void variable::search()
{
char buffer[100],temp[50],usn[11],name[15],name1[15];
int pos,flag=0;//i=0;
student s;
cout<<"\nEnter name to be searched";
cin>>name;
ifstream out1,out2;
out2.open("index6.txt",ios::out);
out1.open("student6.txt",ios::out);
while(1)
{
out2.getline(temp,50,'$');
if(out2.eof())
break;
sscanf(temp,"%[^|]|%[^|]|%d|$",usn,name1,&pos);
out1.getline(buffer,100,'$');
sscanf(buffer,"%[^|]|%[^|]|%[^|]|%[^|]|$",s.usn,s.name,s.sem,s.dept);
if(strcmp(name1,name)==0)
{
cout<<"\nRecord found";
flag=1;
cout<<endl<<s.usn<<" "<<s.name<<" "<<s.sem<<" "<<s.dept;
}
}
if(flag==0)
cout<<"\nRecord doesn't exist";
out1.close();
out2.close();
}
void variable::delete1()
{
char buffer[100],temp[50],usn[11],name[15],name1[15];
int pos,flag=0;
student s;
cout<<"\nEnter name to be deleted";
cin>>name;
ifstream in1,in2;
ofstream of1,of2;
in1.open("index6.txt",ios::out);
in2.open("student6.txt",ios::out);
of1.open("index1.txt",ios::in);
of2.open("stud61.txt",ios::in);
while(1)
{
in1.getline(temp,50,'$');
if(in1.eof())
break;
in2.getline(buffer,100,'$');
sscanf(temp,"%[^|]|%[^|]|%d|$",usn,name1,&pos);
strcat(temp,"$");
int len=strlen(buffer);
if(strcmp(name,name1)!=0)
{
of1<<temp;
of2.write(buffer,len);
}
else
flag=1;
}
if(flag)
cout<<"\nRecord deleted";
else
cout<<"\nRecord doesn't exists";
in1.close();
in2.close();
of1.close();
of2.close();
remove("index6.txt");
remove("student6.txt");
rename("index1.txt","index6.txt");
rename("stud61.txt","student6.txt");
}

int main()
{
int ch;
variable v;
v.setup();
for( ; ; )
{
cout<<"\n1:add\t2:Search\t3:delete\t4:exit";
cout<<"\nEnter the choice:";
cin>>ch;
switch(ch)
{
case 1:v.add(); break;
case 2:v.search(); break;
case 3:v.delete1(); break;
default:exit(0);
}
}
}

p07:

#include <iostream>
#include <cstring>
#include <fstream>

using namespace std;
int m,n;

void writelist()
{
fstream out1,out2;
int i;
char name[20];
out1.open("1.txt",ios::out);
out2.open("2.txt",ios::out);
cout<<"Enter no of names in file1:";
cin>>m;
cout<<"Enter the names in ascending order:\n";
for(i=0;i<m;i++)
{
cin>>name;
out1<<name<<'\n';
}
cout<<"Enter no of names in file2:";
cin>>n;
cout<<"Enter the names in ascending order:\n";
for(i=0;i<n;i++)
{
cin>>name;
out2<<name<<'\n';
}
}

void match()
{
char list1[50][20],list2[50][20];
int i,j;
fstream out1,out2,out3;
out1.open("1.txt",ios::in);
out2.open("2.txt",ios::in);
out3.open("out.txt",ios::out);
i=0;
out1.getline(list1[i],30,'\n');
cout<<"The names in file1 are:\n";
while(!out1.eof())
{
cout<<list1[i]<<endl;
i++;
out1.getline(list1[i],30,'\n');
}
i=0;
cout<<"The names in file2 are:\n";
out2.getline(list2[i],30,'\n');
while(!out2.eof())
{
cout<<list2[i]<<endl;
i++;
out2.getline(list2[i],30,'\n');
}
cout<<"\nCommon names are:\n";
i=j=0;
while(i<m && j<n)
{
if(strcmp(list1[i],list2[j])==0)
{
cout<<list1[i];
out3<<list1[i]<<'\n';
i++;j++;
}
else if(strcmp(list1[i],list2[j])<0)
i++;
else
j++;
}
}

int main()
{
writelist();
match();
return 0;
}

p08:

#include <iostream>
#include <cstring>
#include <fstream>

using namespace std;

class filelist
{
char list[10][20];
int n;
public:
void merger();
void input(char filename[]);
};

char merge[80][20];
int m=0;

void filelist::merger()
{
int i,j,k;
char output[100][20];
i=0;
j=0;
k=0;
while(i<n && j<m)
{
if(strcmp(list[i],merge[j])<0 || strcmp(list[i],merge[j])==0)
strcpy(output[k++],list[i++]);
else
strcpy(output[k++],merge[j++]);
}
while(i<n)
strcpy(output[k++],list[i++]);
while(j<m)
strcpy(output[k++],merge[j++]);
i=0;
while(i<k)
{
strcpy(merge[i],output[i]);
i++;
}
m=k;
}



void filelist::input(char filename[])
{
int i=0;
fstream out(filename,ios::out);
cout<<"Enter the no of names:";
cin>>n;
cout<<"Enter the names in ascending order:\n";
while(i<n)
{
cin>>list[i];
out<<list[i++];
out<<'\n';
}
out.close();
}
int main()
{
int i=0;
filelist t1;
char filename[30];
fstream file("output.txt",ios::out);
cout<<"Enter name of the first file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the second file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the third file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the fourth file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the fifth file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the sixth file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the seventh file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Enter name of the eigth file:";
cin>>filename;
t1.input(filename);
t1.merger();
cout<<"Merged output:"<<endl;

while(i<m)
{
file<<merge[i];
cout<<merge[i]<<endl;
file<<'\n';
i++;
}
file.close();
}

	
	
	


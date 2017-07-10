#include<iostream.h>
#include<time.h>
#include<conio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<IO.h>
#include<graphics.h>
#include<dos.h>
#include<string.h>
#include<stdio.h>
void opn();
int cls();
//Algorithm Variables
	char g[10][20],file[20],path[20],count[20],Mod[10][20],Fd[20];
	int i[10],j[10],m[10],n[10],p[10],q[10],cf=0,df,cu=0,du,t,a=0,a1=-1,c1=0,a2=-1,c2=0;
	int fd[10],r,c1r=0,c1w=0,c1rw=0,c2r=0,c2w=0,c2rw=0,c3r=0,c3w=0,c3rw=0,x=0,y=0,z=0,rnd,fd1[20][3],fd2[20][3],fd3[20][3],ft_count=0,it_count[3]={0,0,0},inode,mod,k,s;
void main()
{
	clrscr();
	//Graphic Variables
	int gd=DETECT,gm;
	initgraph(&gd,&gm,"");
	setcolor(2);
	settextstyle(4,0,3);
	outtextxy(200,15,"*****Open System Call*****");
	setcolor(5);

	opn();

	menu:
	cleardevice();
	settextstyle(3,0,1);
	setcolor(9);
	outtextxy(25,70,"What Next??");
	outtextxy(25,90,"1.) Open Another File.");
	outtextxy(25,110,"2.) Exit.");
	cin>>k;
	switch(k)
	{
		case 1:
			cleardevice();
			opn();
			break;

		case 2:
			exit(0);
	}
	goto menu;
	getch();
}

void opn()
{
	int e;
	setcolor(5);
	settextstyle(3,0,1);
	outtextxy(25,70,"Files Available In the System:");
	outtextxy(25,90,"1.) F1.txt");
	outtextxy(25,110,"2.) F2.txt");
	outtextxy(25,130,"3.) F3.txt");
	setcolor(6);
	outtextxy(25,160,"Please Enter The File To Open: ");
	cin>>r;
	a1++;
	if(r==1)
	{
		e=0;
		strcpy(g[a1],"F1.txt");
	}
	else if(r==2)
	{
		e=1;
		strcpy(g[a1],"F2.txt");
	}
	else if(r==3)
	{
		e=2;
		strcpy(g[a1],"F3.txt");
	}
	else
	{
		//Please Enter Correct
	}
	strcpy(file,g[a1]);
	cleardevice();
	settextstyle(3,0,1);
	outtextxy(25,70,"Enter in which mode you wanna open the file: ");
	outtextxy(25,90,"1.) Read Only");
	outtextxy(25,110,"2.) Write Only");
	outtextxy(25,130,"3.) Read-Write");
	cin>>mod;
	switch(mod)
	{
		case 1:
			fd[a] = open(g[a1],O_RDONLY);
			if(strcmp(g[a1],"F1.txt")==0)
			{
				fd1[x][0]=fd[a];
				x++;
				c1r++;
			}
			if(strcmp(g[a1],"F2.txt")==0)
			{
				fd2[y][0]=fd[a];
				y++;
				c2r++;
			}
			if(strcmp(g[a1],"F3.txt")==0)
			{
				fd3[z][0]=fd[a];
				z++;
				c3r++;
			}
			break;
		case 2:
			fd[a] = open(g[a1],O_WRONLY);
			if(strcmp(g[a1],"F1.txt")==0)
			{
				fd1[x][1]=fd[a];
				x++;
				c1w++;
			}
			if(strcmp(g[a1],"F2.txt")==0)
			{
				fd2[y][1]=fd[a];
				y++;
				c2w++;
			}
			if(strcmp(g[a1],"F3.txt")==0)
			{
				fd3[z][1]=fd[a];
				z++;
				c3w++;
			}
			break;
		case 3:
			fd[a] = open(g[a1],O_RDWR);
			if(strcmp(g[a1],"F1.txt")==0)
			{
				fd1[x][2]=fd[a];
				x++;
				c1rw++;
			}
			if(strcmp(g[a1],"F2.txt")==0)
			{
				fd2[y][2]=fd[a];
				y++;
				c2rw++;
			}
			if(strcmp(g[a1],"F3.txt")==0)
			{
				fd3[z][2]=fd[a];
				z++;
				c3rw++;
			}
			break;
		default:
			//Enter correct mode.
			break;
	}
   //	sprintf(Fd,"FD=%d",fd);
  //	sprintf(Fd,"FD=%d",fd-4);
	a++;
	cleardevice();
	rectangle(50,70,150,450);
	outtextxy(78,48,"UFDT");
	delay(500);
	rectangle(275,70,375,450);
	outtextxy(315,48,"FT");
	delay(500);
	rectangle(500,70,600,450);
	outtextxy(540,48,"IT");

	delay(500);
	setfillstyle(10,4);
	bar3d(51,71,149,109,0,1);
	settextstyle(2,0,5);
	outtextxy(10,83,"FD=0");
	outtextxy(63,83,"STDIN");
	setfillstyle(10,2);
	bar3d(51,110,149,148,0,1);
	settextstyle(2,0,5);
	outtextxy(10,120,"FD=1");
	outtextxy(61,120,"STDOUT");
	setfillstyle(10,3);
	bar3d(51,149,149,187,0,1);
	settextstyle(2,0,5);
	outtextxy(10,159,"FD=2");
	outtextxy(61,159,"STDERR");

	delay(1000);
	ft_count=0;
	a2++;
	//Writing into FT
	randomize();
	rnd = random(10);
	p[c1] = 71 + 38*rnd;
	q[c1] = p[c1] + 38;
	if(e==0)
	{
	     /*	p[c1] = 71 + 38*(mod-1);
		q[c1] = p[c1] + 38;  */
		if(mod==1)
		{
			strcpy(Mod[a2],"O_RDONLY");
		}
		else if(mod==2)
		{
			strcpy(Mod[a2],"O_WRONLY");
		}
		else if(mod==3)
		{
			strcpy(Mod[a2],"O_RDWR");
		}
		else
		{
			cleardevice();
			settextstyle(3,0,4);
			outtextxy(180,100,"Bad File Mode");
			getch();
			exit(0);
		}
	}
	else if(e==1)
	{
		if(mod==1)
		{
		//	p[c1] = 71 + 38*3;
		//	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_RDONLY");
		}
		else if(mod==2)
		{
		 //	p[c1] = 71 + 38*4;
		 //	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_WRONLY");
		}
		else if(mod==3)
		{
		 //	p[c1] = 71 + 38*5;
		//	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_RDWR");
		}
		else
		{
			cleardevice();
			settextstyle(3,0,4);
			outtextxy(180,100,"Bad File Mode");
			getch();
			exit(0);
		}
	}
	else if(e==2)
	{
		if(mod==1)
		{
		//	p[c1] = 71 + 38*6;
		//	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_RDONLY");
		}
		else if(mod==2)
		{
		//	p[c1] = 71 + 38*7;
		//	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_WRONLY");
		}
		else if(mod==3)
		{
		//	p[c1] = 71 + 38*8;
		//	q[c1] = p[c1] + 38;
			strcpy(Mod[a2],"O_RDWR");
		}
		else
		{
			cleardevice();
			settextstyle(3,0,4);
			outtextxy(180,100,"Bad File Mode");
			getch();
			exit(0);
		}
	}
	else
	{
		cleardevice();
		settextstyle(3,0,4);
		outtextxy(180,100,"Bad File");
		getch();
		exit(0);
	}
	ft_count++;
	for(t=0; t<=c1; t++)
	{
		setfillstyle(10,4);
		bar3d(276,p[t],374,q[t],0,1);
		sprintf(count,"count: %d",ft_count);
		outtextxy(288,p[t]+3,Mod[t]);
		outtextxy(283,p[t]+17,count);
	}
	c1++;

	delay(1000);
	//Writing into IT
	inode = (rand()%1000);
	if(e==0)
	{
		m[c2] = 71 + 38*2;
		n[c2] = m[c2] + 38;
		it_count[0]++;
	}
	if(e==1)
	{
		m[c2] = 71 + 38*6;
		n[c2] = m[c2] + 38;
		it_count[1]++;
	}
	if(e==2)
	{
		m[c2] = 71 + 38*9;
		n[c2] = m[c2] + 38;
		it_count[2]++;
	}
	if(e>2)
	{
		cleardevice();
		settextstyle(3,0,4);
		outtextxy(180,100,"Bad Inode");
		getch();
		exit(0);
	}
	for(t=0; t<=c2; t++)
	{
		setfillstyle(11,2);
		bar3d(501,m[t],599,n[t],0,1);
		strcpy(path,"/TC/");
		strcat(path,g[t]);
		sprintf(count,"count: %d",it_count[e]);
		outtextxy(505,m[t]+3,path);
		outtextxy(505,m[t]+17,count);
		delay(1000);
		line(375,(p[t]+q[t])/2,500,(m[t]+n[t])/2);
	}
	c2++;

	delay(1000);
	//Writing in UFDT
	i[cu] = 71 + 38*(fd[cu]-4);
	j[cu] = i[cu] + 38;
	du=cu;
	for(t=0; t<=du; t++)
	{
		sprintf(Fd,"FD=%d",fd[t]-4);
		setfillstyle(11,1);
		bar3d(51,i[t],149,j[t],0,1);
		line(150,(i[t]+j[t])/2,275,(p[t]+q[t])/2);
		settextstyle(2,0,5);
		outtextxy(10,i[t]+10,Fd);
		outtextxy(61,i[t]+9,g[t]);
	}
	cu++;
	getch();
}
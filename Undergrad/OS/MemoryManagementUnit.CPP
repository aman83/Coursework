#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<graphics>
#include<conio.h>
#define total 3000
void sort(int);

       float s,n,nn,gh,sh,i,hole[10],shole[10];
       float thole,nhole[10],np,pr[10],lr,sm,not[10];
       int a;

       void getpart()
       {
	n=getmaxy();
	n=n-130;  //right,bottommost part of rectangle
  sa:   cout<<"Total memory of 3000k";
	cout<<endl<<"How Many Holes Do You Want?: ";
	cin>>nn;
	nhole[0]=0;
	hole[0]=0;
	thole=0;
	for(i=1;i<=nn;i++)
	{
		cout<<"Enter size of "<<i<<"->";
		cin>>hole[i];
		thole=thole+hole[i];
		nhole[i]=thole;
	}
	if(thole>total)
	{
		cout<<"memory overflowed"<<endl;
		cout<<endl<<"Try again"<<endl<<endl;
		goto sa;
	}
	s=(n/thole);
       }
       void genpart()
       {
	clrscr();
	setcolor(2);
	line(425,25,475,25); //1
	for(i=0;i<nn-1;i++)        //nn=no. of holes
	{   //creating lines between the rectangle after every hole
		line(425,(nhole[i+1]*s)+25,475,(nhole[i+1]*s)+25);
	}
	line(425,25+(thole*s),475,25+(thole*s)); //same as 1
	line(425,25,425,25+(thole*s));
	line(475,25,475,25+(thole*s));
	}
	void getpr()
	{
		cout<<"Enter how many process u want to enter->";
		cin>>np;
		int col=2;
		int p=0;
		for(int i=0;i<np;i++)
		{
			cout<<"Enter "<<i+1<<" ->";//entering size of processes
			setfillstyle(col,6);
			cin>>pr[i];
			bar(230,20+p,250,30+p);
			p=p+15;
			col++;
		}
	}/////////////////////////////////////////////////////////////
	void nb()
	{
		float *y,*h;
		a=0;
		for(int i=0;i<10;i++)
		{
		y[i]=0;
		h[i]=0;
		}
		int co=2;
		int j=0;
		for(i=0;i<np;i++)
		{
			for(j=0; j<=nn; j++)
			{
			    setfillstyle(co,4);
			    if(pr[i]<=hole[j+1])
			    {
			      hole[j+1]=hole[j+1]-pr[i];
			      getch();
			       if(y[j]==1)
				{
				 bar(427,(h[j])*s+25,473,(nhole[j+1]-hole[j+1])*s+25);
				}
			       else
				{
				 bar(427,(nhole[j])*s+27,473,(nhole[j+1]-hole[j+1])*s+25);
				}
			      y[j]=1;
			      h[j]=nhole[j+1]-hole[j+1];
			      co++;
			  //    break;
			    }
			    if(j==nn)
			    {
			      not[a++]=pr[i];
			      co++;
			    }
			}
		}
		sort(2);
		gh=hole[0];
		sh=hole[nn-1];
	}
	void fb()
	{
		float *y,*h;
		a=0;
		for(int i=0;i<10;i++)
		{
		y[i]=0;
		h[i]=0;
		}
		int co=2;

		for(i=0;i<np;i++)
		{
			for(int j=0;j<=nn;j++)
			{
				setfillstyle(co,3);
				if(pr[i]<=hole[j+1])
				{
				hole[j+1]=hole[j+1]-pr[i];
				getch();
			       if(y[j]==1)
			       {

				bar(427,(h[j])*s+25,473,(nhole[j+1]-hole[j+1])*s+25);
			       }
			      else
			      {
				bar(427,(nhole[j])*s+27,473,(nhole[j+1]-hole[j+1])*s+25);
			      }
			      y[j]=1;
			      h[j]=nhole[j+1]-hole[j+1];
					co++;

					break;
				}
				if(j==nn && (pr[i]>hole[j+1]))
				{
				not[a++]=pr[i];
				co++;
				}
			}
		}
		sort(2);
		gh=hole[0];
		sh=hole[nn-1];
	}
	void sort(int t)
	{
	float temp;
	for(int i=0;i<=nn;i++)
		{
			for(int j=0;j<=nn;j++)
			{
				if(t==1)
				{
				if(shole[j]>shole[i])
				{
					temp=shole[j];
					shole[j]=shole[i];
					shole[i]=temp;
				}}
				else if(t==0)
				{
				if(shole[j]<shole[i])
				{
					temp=shole[j];
					shole[j]=shole[i];
					shole[i]=temp;
				}}
				else
				{
				if(hole[j]<hole[i])
				{
					temp=hole[j];
					hole[j]=hole[i];
					hole[i]=temp;
				}}

			}
		}
	}
	void bb()
	{
		a=0;
		int i,j,m,g,l,k,co=2;
		float y[10],h[10];
		for(i=0;i<10;i++)
		{
			shole[i]=hole[i];
			h[i]=0;
			y[i]=0;
		}
		sort(1);
		for(i=0;i<np;i++)
		{
			for(g=0;g<=nn;g++)
			{
				if(pr[i]<=shole[g])
				{
					for(k=0;k<=nn;k++)
					{
						if(hole[k]==shole[g])
						{
						l=g;
						j=k;
						break;
						}
					}
					setfillstyle(co,11);
					hole[j]=hole[j]-pr[i];
					shole[l]=shole[l]-pr[i];
					sort(1);
					hole[j+1]=hole[j+1]-pr[i];
			      if(y[j]==1)
			      {

					bar(427,(h[j])*s+25,473,(nhole[j]-hole[j])*s+25);
			      }
			      else
			      {
					bar(427,(nhole[j-1])*s+27,473,(nhole[j]-hole[j])*s+25);
			      }
			      y[j]=1;
			      h[j]=nhole[j]-hole[j];
			      getch();
					co++;
					break;
				}
				if(g==nn && !(pr[i]<=shole[g]))
				{
				not[a]=pr[i];
				a++;
		     //		getch();
		     co++;
		     }
			}
		}
		sh=shole[1];
		gh=shole[nn];
	}
	void wb()
	{
		a=0;
		int i,j,m,g,l,co=2;
		float y[10],h[10];
		for(i=0;i<10;i++)
		{
		y[i]=0;
		h[i]=0;
		shole[i]=hole[i];
		}
		sort(0);
		g=0;
		for(i=0;i<np;i++)
		{
				if(pr[i]<=shole[g])
				{
					for(int k=0;k<=nn;k++)
					{
						if(hole[k]==shole[g])
						{
						l=g;
						j=k;
						break;
						}
					}
					setfillstyle(co,8);
					hole[j]=hole[j]-pr[i];
					shole[l]=shole[l]-pr[i];
					sort(0);
			      if(y[j]==1)
			      {

					bar(427,(h[j])*s+25,473,(nhole[j]-hole[j])*s+25);
			      }
			      else
			      {
					bar(427,(nhole[j-1])*s+27,473,(nhole[j]-hole[j])*s+25);
			      }
			      getch();
			      y[j]=1;
			      h[j]=nhole[j]-hole[j];
					co++;
				}
				else
				{
					not[a]=pr[i];
					a++;
					co++;
				}
		}
		gh=shole[0];
		sh=shole[nn-1];
	}
	void attr()
	{
		if(a!=0)
	{
	cout<<"Processes not allowed ->";
	for(int i=0;i<a;i++)
		cout<<not[i]<<endl;
	}
	cout<<endl<<"Greatest hole -> "<<gh<<endl;
	cout<<endl<<"Smallest hole -> "<<sh;
	}
void main()
{
       //	mmu sa;
	int na;
	int gd=DETECT,gm;
	initgraph(&gd,&gm,"");
	getpart();
	genpart();
	getpr();
	cout<<endl<<"Enter 1 for first fit";
	cout<<endl<<"Enter 2 for best fit";
	cout<<endl<<"Enter 3 for worst fit";
	cout<<endl<<"Enter 4 for next fit";
	cout<<endl<<"Enter any other key to terminate->";
	cin>>na;
	switch(na)
	{
		case 1:
			fb();
			break;
		case 2:
			bb();
			break;
		case 3:
			wb();
			break;
		case 4:
			nb();
			break;
		default:
			cout<<"Please Enter Appropriate Entry";
	}
	attr();
	getch();
	exit(0);
      closegraph();
}

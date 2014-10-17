import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Starfield extends PApplet {

Particle [] galaxy = new Particle [200];

public void setup()
{
	size (400,400);
	noCursor();
	for (int i=1; i<galaxy.length; i++)
	{
		galaxy [i] = new NormalParticle();
	}
		galaxy [0] = new OddballParticle();
}

public void draw()
{
	fill(0,0,0,50);
 	rect(0,0,400,400);
	for (int i=1; i<galaxy.length; i++)
  {
    galaxy[i].move();
    galaxy[i].show();
    galaxy[i].wrap();
  }
  	galaxy[0].move();
    galaxy[0].show();
    galaxy[0].wrap();
    target();
}


public void target()
{
	stroke(255,0,0);
	strokeWeight(2);
	line(mouseX, mouseY-7, mouseX, mouseY+7);
	line(mouseX-7, mouseY, mouseX+7, mouseY);
}

class NormalParticle implements Particle
{
	double myX, myY, speedX, speedY, angleP, parSize;
	int colorR, colorB, colorG;
	NormalParticle()
	{
		myX = 200;
		myY = 200;
		angleP = (Math.random()*2*Math.PI);
		speedX = (Math.random()*2+1);
		speedY = (Math.random()*2+1);
		colorR = 168;
		colorB = 111;
		colorG = 242;
		parSize = 2;
	}
	public void move()
	{
		myX = myX + Math.cos(angleP)*speedX;
		myY = myY + Math.sin(angleP)*speedY;
		parSize = parSize+.03f;
	}
	public void show()
	{
		noStroke();
		fill(colorR,colorB,colorG);
		ellipse((float)myX, (float)myY, (float)parSize, (float)parSize);
	}
	public void wrap()
	{
		if (myX>400 || myX<0)
		{
			myX=200;
			myY=200;
			parSize = 2;
		}
		if (myY>400 || myY<0)
		{
			myX=200;
			myY=200;
			parSize = 2;
		}

	}
}
interface Particle
{
	public void show();
	public void move();
	public void wrap();
}
class OddballParticle implements Particle
{
	int oddX, oddY;
	OddballParticle()
	{
		oddX = 200;
		oddY = 200;
	}
	public void move()
	{
		if (oddX > mouseX)
		{
			oddX = oddX + (int)(Math.random()*4)-2;
		}
		if (oddX < mouseX)
		{
			oddX = oddX + (int)(Math.random()*4)-1;
		}
		if (oddY > mouseY)
		{
			oddY = oddY + (int)(Math.random()*4)-2;
		}
		if (oddY < mouseY)
		{
			oddY = oddY + (int)(Math.random()*4)-1;
		}
		else
		{
			oddX = oddX + (int)(Math.random()*3)-1;
			oddY = oddY + (int)(Math.random()*3)-1;
		}
		
	}
	public void show()
	{
		stroke(255);
		strokeWeight(1);
		noFill();
		ellipse(oddX, oddY, 0.1f*dist(oddX,oddY,200,200), 0.1f*dist(oddX,oddY,200,200));
	}
	public void wrap()
	{
		if (oddX>400 || oddX<0)
		{
			oddX=200;
			oddY=200;
		}
		if (oddY>400 || oddY<0)
		{
			oddX=200;
			oddY=200;
		}

	}
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

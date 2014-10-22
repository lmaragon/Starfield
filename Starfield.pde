Particle [] galaxy = new Particle [201];

void setup()
{
	size (400,400);
	noCursor();
	for (int i=2; i<galaxy.length; i++)
	{
		galaxy [i] = new NormalParticle();
	}
		galaxy [0] = new OddballParticle();
		galaxy [1] = new Jumbo();
}

void draw()
{
	fill(0,0,0,50);
 	rect(0,0,400,400);
	for (int i=2; i<galaxy.length; i++)
  {
    galaxy[i].move();
    galaxy[i].show();
    galaxy[i].wrap();
  }
  	galaxy[0].move();
  	galaxy[1].move();
    galaxy[0].show();
    galaxy[1].show();
    galaxy[0].wrap();
    galaxy[1].wrap();
    target();
}

void target()
{
	stroke(255,0,0);
	strokeWeight(2);
	line(mouseX, mouseY-7, mouseX, mouseY+7);
	line(mouseX-7, mouseY, mouseX+7, mouseY);
}

class NormalParticle implements Particle
{
	double myX, myY, speedX, speedY, angleP, parSize;
	NormalParticle()
	{
		myX = 200;
		myY = 200;
		angleP = (Math.random()*2*Math.PI);
		speedX = (Math.random()*2+1);
		speedY = (Math.random()*2+1);
		parSize = 2;
	}
	public void move()
	{
		myX = myX + Math.cos(angleP)*speedX;
		myY = myY + Math.sin(angleP)*speedY;
		parSize = parSize+.03;
	}
	public void show()
	{
		noStroke();
		fill(168,111,242);
		ellipse((float)myX, (float)myY, (float)parSize, (float)parSize);
	}
	public void wrap()
	{
		if (myX>400 || myX<0)
		{
			myX=200;
			myY=200;
			parSize = 2;
			angleP = (Math.random()*2*Math.PI);
			speedX = (Math.random()*2+1);
			speedY = (Math.random()*2+1);
		}
		if (myY>400 || myY<0)
		{
			myX=200;
			myY=200;
			parSize = 2;
			angleP = (Math.random()*2*Math.PI);
			speedX = (Math.random()*2+1);
			speedY = (Math.random()*2+1);
		}

	}
}

class Jumbo extends NormalParticle
{
	Jumbo()
	{
		parSize = 15;
	}
public void wrap()
	{
		if (myX>400 || myX<0)
		{
			myX=200;
			myY=200;
			parSize = 15;
			angleP = (Math.random()*2*Math.PI);
			speedX = (Math.random()*2+1);
			speedY = (Math.random()*2+1);
		}
		if (myY>400 || myY<0)
		{
			myX=200;
			myY=200;
			parSize = 15;
			angleP = (Math.random()*2*Math.PI);
			speedX = (Math.random()*2+1);
			speedY = (Math.random()*2+1);
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
		ellipse(oddX, oddY, 0.1*dist(oddX,oddY,200,200), 0.1*dist(oddX,oddY,200,200));
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



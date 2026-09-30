public class Player extends Sprite {
	public Player() {
		super();
	}

	public Player(float x, float y, float r, color c) {
		super(x, y, r, c);
	}

	@Override
	public void display() {
		super.display();
		noStroke();
		fill(255);
		circle(getX(), getY(), 5);
	}

	public void move(float cameraX, float cameraY) {
		float r = getRadius();

		float worldMouseX = mouseX - cameraX;
		float worldMouseY = mouseY - cameraY;

		float x = getX() + (worldMouseX - getX()) * 0.08;
		x = constrain(x, r, gameW - r);

		float y = getY() + (worldMouseY - getY()) * 0.08;
		y = constrain(y, r, gameH - r);

		setPosition(x, y);
	}

	public void eat(Ball ball) {
		setRadius(sqrt(getRadius() * getRadius() + ball.getRadius() * ball.getRadius()));
	}
}

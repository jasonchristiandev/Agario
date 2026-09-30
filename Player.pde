public class Player extends Sprite {
	public Player() {
		this(gameW / 2, gameH / 2, 24, color(25, 65, 230));
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

		float velX = (worldMouseX - getX()) * 0.08;
        float velY = (worldMouseY - getY()) * 0.08;
        float speed = sqrt(velX * velX + velY * velY);
        float cspeed = constrain(speed, 0, maxPlayerSpeed);
        if (speed < 0.01) return;
        float x = getX() + velX / speed * cspeed;
        float y = getY() + velY / speed * cspeed;
		x = constrain(x, r, gameW - r);
		y = constrain(y, r, gameH - r);

		setPosition(x, y);
	}

	public void eat(Ball ball) {
		setRadius(sqrt(getRadius() * getRadius() + ball.getRadius() * ball.getRadius()));
	}
}

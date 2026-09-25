public class Ball extends Sprite {
	private float vx, vy;

	public Ball(color c) {
		this((float)(Math.random() * 534 + 33),
			 (float)(Math.random() * 534 + 33),
			 (float)(Math.random() * 28 + 5),
			 (float)(Math.random() * 2 - 1),
			 (float)(Math.random() * 2 - 1), c);
	}

	public Ball(float x, float y, float r, float vx, float vy, color c) {
		super(x, y, r, c);
		this.vx = vx;
		this.vy = vy;
	}

	public void update() {
		float x = getX() + vx;
		float y = getY() + vy;
		float r = getRadius();
		if (x - r < 0 || x + r > width) {
			vx *= -1;
			x = constrain(x, r, width - r);
		}
		if (y - r < 0 || y + r > height) {
			vy *= -1;
			y = constrain(y, r, height - r);
		}
		setPosition(x, y);
	}
}

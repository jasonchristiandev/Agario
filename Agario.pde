Ball[] b;
Player player;
int score;
boolean gameOver;

void setup() {
	size(600, 600);
	frameRate(60);
	resetGame();
}

void resetGame() {
	b = new Ball[35];
	for (int i = 0; i < b.length; i++) {
		b[i] = new Ball(color(240, 45, 45));
	}
	player = new Player();
	score = 0;
	gameOver = false;
}

void draw() {
	background(255);
	Ball biggest = largest(b);
	for (int i = 0; i < b.length; i++) {
		b[i].setColor(b[i] == biggest ? color(255, 145, 20) : color(240, 45, 45));
		b[i].update();
		b[i].display();
	}

	if (!gameOver) {
		player.move();
		for (int i = 0; i < b.length; i++) {
			if (player.touches(b[i])) {
				if (player.getRadius() > b[i].getRadius() * 1.1) {
					player.eat(b[i]);
					score++;
					b[i] = new Ball(color(240, 55, 55));
				} else if (b[i].getRadius() > player.getRadius() * 1.1) {
					gameOver = true;
					break;
				}
			}
		}
	}

	player.display();

	noStroke();
	fill(0);
	textSize(15);
	text("Score: " + score + "  |  Radius: " + nf(player.getRadius(), 0, 1), 12, 24);
	textSize(12);
	text("Mouse: move  |  Orange: biggest  |  R: reset", 12, 43);

	if (gameOver) {
		fill(0, 170);
		rect(0, 250, width, 100);
		fill(255);
		textAlign(CENTER);
		textSize(24);
		text("GAME OVER", width / 2, 290);
		textSize(15);
		text("Press R to restart", width / 2, 320);
		textAlign(LEFT);
	}
}

void keyPressed() {
	if (key == 'r' || key == 'R') resetGame();
}

public Ball largest(Ball[] balls) {
	Ball result = balls[0];
	for (int i = 1; i < balls.length; i++) {
		if (balls[i].getRadius() > result.getRadius()) {
			result = balls[i];
		}
	}
	return result;
}

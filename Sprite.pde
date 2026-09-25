#jason Jelek
public class Sprite {
    private float x, y;
    private float r;
    private color c;

    public Sprite() {
        this(width / 2, height / 2, 24, color(25, 65, 230));
    }

    public Sprite(float x, float y, float r, color c) {
        this.x = x;
        this.y = y;
        setRadius(r);
        this.c = c;
    }

    public float getX() { return x; }
    public float getY() { return y; }
    public float getRadius() { return r; }
    public color getColor() { return c; }
    public void setPosition(float x, float y) {
        this.x = x;
        this.y = y;
    }
    public void setRadius(float r) {
        if (r > 0) this.r = r;
    }
    public void setColor(color c) {
        this.c = c;
    }
    public void display() {
        stroke(35);
        strokeWeight(1);
         fill(c);
        circle(x, y, r * 2);
    }
    public boolean touches(Sprite other) {
        return dist(x, y, other.getX(), other.getY()) < r + other.getRadius();
    }
}

public class Lasagna {
    int timePerLayer = 2;

    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int elapsedTime) {
        return expectedMinutesInOven() - elapsedTime;
    }

    public int preparationTimeInMinutes(int layers) {
        return timePerLayer * layers;
    }

    public int totalTimeInMinutes(int layers, int elapsed) {
        return preparationTimeInMinutes(layers) + elapsed;
    }
}

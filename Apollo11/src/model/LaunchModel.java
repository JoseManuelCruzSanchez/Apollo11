package model;

public class LaunchModel {
    private int timeRemaining;
    private boolean isCancelled = false;

    public LaunchModel(int timeRemaining) {
        this.timeRemaining = timeRemaining;
    }

    public void setTimeRemaining(int time) {
        this.timeRemaining = time;
    }

    public int getTimeRemaining() {
        return timeRemaining;
    }

    public void cancel() {
        isCancelled = true;
    }

    public boolean isCancelled() {
        return isCancelled;
    }
}

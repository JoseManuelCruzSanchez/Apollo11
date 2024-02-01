package controller;

import model.LaunchModel;
import view.LaunchView;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LaunchController {
    private LaunchView view;
    private LaunchModel model;
    private Thread countdownThread;

    public LaunchController(LaunchView view, LaunchModel model) {
        this.view = view;
        this.model = model;
        initController();
    }

    private void initController() {
        view.startButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int seconds = Integer.parseInt(view.countdownField.getText());
                model.setTimeRemaining(seconds);
                view.progressBar.setMaximum(seconds);
                countdownThread = new Thread(new CountdownTask());
                countdownThread.start();
            }
        });

        view.cancelButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                model.cancel();
            }
        });
    }

    private class CountdownTask implements Runnable {
        @Override
        public void run() {
            try {
                while (model.getTimeRemaining() > 0 && !model.isCancelled()) {
                    SwingUtilities.invokeLater(() -> {
                        view.statusLabel.setText("Time Remaining: " + model.getTimeRemaining());
                        view.progressBar.setValue(view.progressBar.getMaximum() - model.getTimeRemaining());
                    });
                    model.setTimeRemaining(model.getTimeRemaining() - 1);
                    Thread.sleep(1000);
                }
                SwingUtilities.invokeLater(() -> {
                    if (model.isCancelled()) {
                        view.statusLabel.setText("Launch Cancelled");
                        JOptionPane.showMessageDialog(view.frame, "Launch Cancelled");
                    } else {
                        view.statusLabel.setText("Launch Successful");
                        JOptionPane.showMessageDialog(view.frame, "Launch Successful");
                    }
                });
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            LaunchView view = new LaunchView();
            LaunchModel model = new LaunchModel(0);
            new LaunchController(view, model);
        });
    }
}

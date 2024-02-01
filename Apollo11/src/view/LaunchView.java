package view;

import javax.swing.*;
import java.awt.*;

public class LaunchView {
    public JFrame frame;
    public JTextField countdownField;
    public JButton startButton, cancelButton;
    public JLabel statusLabel;
    public JProgressBar progressBar;

    public LaunchView() {
        frame = new JFrame("Apollo 11 Launch Simulator");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setLayout(new FlowLayout());

        countdownField = new JTextField(10);
        frame.add(countdownField);

        progressBar = new JProgressBar(0, 100);
        frame.add(progressBar);

        startButton = new JButton("Start Countdown");
        frame.add(startButton);

        cancelButton = new JButton("Cancel");
        frame.add(cancelButton);

        statusLabel = new JLabel("Status: Ready");
        frame.add(statusLabel);

        frame.setVisible(true);
    }
}

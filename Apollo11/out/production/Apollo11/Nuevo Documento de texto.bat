@echo off

REM Creando la estructura de directorios
mkdir src
cd src
mkdir model view controller
cd ..

REM Creando archivos para el modelo
echo package model; > src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo public class LaunchModel { >> src\model\LaunchModel.java
echo     private int timeRemaining; >> src\model\LaunchModel.java
echo     private boolean isCancelled = false; >> src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo     public LaunchModel(int timeRemaining) { >> src\model\LaunchModel.java
echo         this.timeRemaining = timeRemaining; >> src\model\LaunchModel.java
echo     } >> src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo     public void setTimeRemaining(int time) { >> src\model\LaunchModel.java
echo         this.timeRemaining = time; >> src\model\LaunchModel.java
echo     } >> src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo     public int getTimeRemaining() { >> src\model\LaunchModel.java
echo         return timeRemaining; >> src\model\LaunchModel.java
echo     } >> src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo     public void cancel() { >> src\model\LaunchModel.java
echo         isCancelled = true; >> src\model\LaunchModel.java
echo     } >> src\model\LaunchModel.java
echo. >> src\model\LaunchModel.java
echo     public boolean isCancelled() { >> src\model\LaunchModel.java
echo         return isCancelled; >> src\model\LaunchModel.java
echo     } >> src\model\LaunchModel.java
echo } >> src\model\LaunchModel.java

REM Creando archivos para la vista
echo package view; > src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo import javax.swing.*; >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo public class LaunchView { >> src\view\LaunchView.java
echo     public JFrame frame; >> src\view\LaunchView.java
echo     public JTextField countdownField; >> src\view\LaunchView.java
echo     public JButton startButton, cancelButton; >> src\view\LaunchView.java
echo     public JLabel statusLabel; >> src\view\LaunchView.java
echo     public JProgressBar progressBar; >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo     public LaunchView() { >> src\view\LaunchView.java
echo         frame = new JFrame("Apollo 11 Launch Simulator"); >> src\view\LaunchView.java
echo         frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); >> src\view\LaunchView.java
echo         frame.setSize(400, 300); >> src\view\LaunchView.java
echo         frame.setLayout(new FlowLayout()); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         countdownField = new JTextField(10); >> src\view\LaunchView.java
echo         frame.add(countdownField); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         progressBar = new JProgressBar(0, 100); >> src\view\LaunchView.java
echo         frame.add(progressBar); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         startButton = new JButton("Start Countdown"); >> src\view\LaunchView.java
echo         frame.add(startButton); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         cancelButton = new JButton("Cancel"); >> src\view\LaunchView.java
echo         frame.add(cancelButton); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         statusLabel = new JLabel("Status: Ready"); >> src\view\LaunchView.java
echo         frame.add(statusLabel); >> src\view\LaunchView.java
echo. >> src\view\LaunchView.java
echo         frame.setVisible(true); >> src\view\LaunchView.java
echo     } >> src\view\LaunchView.java
echo } >> src\view\LaunchView.java

REM Creando archivos para el controlador
echo package controller; > src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo import model.LaunchModel; >> src\controller\LaunchController.java
echo import view.LaunchView; >> src\controller\LaunchController.java
echo import javax.swing.*; >> src\controller\LaunchController.java
echo import java.awt.event.ActionEvent; >> src\controller\LaunchController.java
echo import java.awt.event.ActionListener; >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo public class LaunchController { >> src\controller\LaunchController.java
echo     private LaunchView view; >> src\controller\LaunchController.java
echo     private LaunchModel model; >> src\controller\LaunchController.java
echo     private Thread countdownThread; >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo     public LaunchController(LaunchView view, LaunchModel model) { >> src\controller\LaunchController.java
echo         this.view = view; >> src\controller\LaunchController.java
echo         this.model = model; >> src\controller\LaunchController.java
echo         initController(); >> src\controller\LaunchController.java
echo     } >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo     private void initController() { >> src\controller\LaunchController.java
echo         view.startButton.addActionListener(new ActionListener() { >> src\controller\LaunchController.java
echo             @Override >> src\controller\LaunchController.java
echo             public void actionPerformed(ActionEvent e) { >> src\controller\LaunchController.java
echo                 int seconds = Integer.parseInt(view.countdownField.getText()); >> src\controller\LaunchController.java
echo                 model.setTimeRemaining(seconds); >> src\controller\LaunchController.java
echo                 view.progressBar.setMaximum(seconds); >> src\controller\LaunchController.java
echo                 countdownThread = new Thread(new CountdownTask()); >> src\controller\LaunchController.java
echo                 countdownThread.start(); >> src\controller\LaunchController.java
echo             } >> src\controller\LaunchController.java
echo         }); >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo         view.cancelButton.addActionListener(new ActionListener() { >> src\controller\LaunchController.java
echo             @Override >> src\controller\LaunchController.java
echo             public void actionPerformed(ActionEvent e) { >> src\controller\LaunchController.java
echo                 model.cancel(); >> src\controller\LaunchController.java
echo             } >> src\controller\LaunchController.java
echo         }); >> src\controller\LaunchController.java
echo     } >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo     private class CountdownTask implements Runnable { >> src\controller\LaunchController.java
echo         @Override >> src\controller\LaunchController.java
echo         public void run() { >> src\controller\LaunchController.java
echo             try { >> src\controller\LaunchController.java
echo                 while (model.getTimeRemaining() > 0 && !model.isCancelled()) { >> src\controller\LaunchController.java
echo                     SwingUtilities.invokeLater(() -> { >> src\controller\LaunchController.java
echo                         view.statusLabel.setText("Time Remaining: " + model.getTimeRemaining()); >> src\controller\LaunchController.java
echo                         view.progressBar.setValue(view.progressBar.getMaximum() - model.getTimeRemaining()); >> src\controller\LaunchController.java
echo                     }); >> src\controller\LaunchController.java
echo                     model.setTimeRemaining(model.getTimeRemaining() - 1); >> src\controller\LaunchController.java
echo                     Thread.sleep(1000); >> src\controller\LaunchController.java
echo                 } >> src\controller\LaunchController.java
echo                 SwingUtilities.invokeLater(() -> { >> src\controller\LaunchController.java
echo                     if (model.isCancelled()) { >> src\controller\LaunchController.java
echo                         view.statusLabel.setText("Launch Cancelled"); >> src\controller\LaunchController.java
echo                         JOptionPane.showMessageDialog(view.frame, "Launch Cancelled"); >> src\controller\LaunchController.java
echo                     } else { >> src\controller\LaunchController.java
echo                         view.statusLabel.setText("Launch Successful"); >> src\controller\LaunchController.java
echo                         JOptionPane.showMessageDialog(view.frame, "Launch Successful"); >> src\controller\LaunchController.java
echo                     } >> src\controller\LaunchController.java
echo                 }); >> src\controller\LaunchController.java
echo             } catch (InterruptedException e) { >> src\controller\LaunchController.java
echo                 e.printStackTrace(); >> src\controller\LaunchController.java
echo             } >> src\controller\LaunchController.java
echo         } >> src\controller\LaunchController.java
echo     } >> src\controller\LaunchController.java
echo. >> src\controller\LaunchController.java
echo     public static void main(String[] args) { >> src\controller\LaunchController.java
echo         SwingUtilities.invokeLater(() -> { >> src\controller\LaunchController.java
echo             LaunchView view = new LaunchView(); >> src\controller\LaunchController.java
echo             LaunchModel model = new LaunchModel(0); >> src\controller\LaunchController.java
echo             new LaunchController(view, model); >> src\controller\LaunchController.java
echo         }); >> src\controller\LaunchController.java
echo     } >> src\controller\LaunchController.java
echo } >> src\controller\LaunchController.java

echo Archivos del proyecto MVC creados exitosamente.

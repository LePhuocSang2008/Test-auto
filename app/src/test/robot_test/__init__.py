from robot import run  
import os  

# Đường dẫn tuyệt đối đến thư mục Logs  
log_dir = os.path.abspath('D:/Learn Test Automation/reactjs/app/src/test/robot_test/src/Logs')  

# Đường dẫn đến các tệp log  
log_path = os.path.join(log_dir, 'log.html')  
report_path = os.path.join(log_dir, 'report.html')  
output_path = os.path.join(log_dir, 'output.xml')  

# Chạy tất cả các tệp robot trong thư mục Testcase  
run('Testcase/*.robot', log=log_path, report=report_path, output=output_path)
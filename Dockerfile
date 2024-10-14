# Sử dụng Ubuntu làm hình ảnh cơ sở
FROM ubuntu:latest

# Thông tin người duy trì
MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Thêm mã nguồn vào hình ảnh
ADD . /flask_app

# Đặt thư mục làm việc
WORKDIR /flask_app

# Tạo một môi trường ảo
RUN python3 -m venv venv

# Cài đặt pip trong môi trường ảo và cài đặt gói từ requirements.txt
RUN /flask_app/venv/bin/python -m pip install --upgrade pip && \
    /flask_app/venv/bin/python -m pip install -r requirements.txt

RUN ls -R /flask_app  # This line will list contents of /flask_app

# Chạy ứng dụng Flask
CMD ["/flask_app/venv/bin/python", "app.py"]


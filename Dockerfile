# 使用官方的 Python 运行时作为基础镜像
FROM python:3.9

# 设置工作目录为 /app
WORKDIR /app

# 在工作目录下创建一个名为 app.py 的文件
RUN echo "print('hello')" > app.py

# 定义容器启动时要执行的命令
CMD ["python", "app.py"]

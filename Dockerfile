FROM Zed-Thon/ZED_USERBOT:alpine
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
#clonning repo 
RUN git clone https://github.com/Zed-Thon/ZED_USERBOT.git /root/userbot
#working directory 
WORKDIR /root/userbot

# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]

FROM jallytom/erlang

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

####### PORTS ########
#Main rabbitmq port
EXPOSE 5672
#port mapper daemon (epmd)
EXPOSE 4369
#inet_dist_listen
EXPOSE 35197
#rabbitmq management console
EXPOSE 15672

#ENV RABBITMQ_HOME "C:\rabbitmq"
ENV RABBITMQ_CONFIG_FILE "C:\rabbitmq"
#install rabbitmq
COPY ["rabbitmq.config"," C:/"]
ADD ["rabbitmq.tar","c:/"]


#set up the path to the config file
VOLUME C:\\Users\\ContainerAdministrator\\appdata\\Roaming\\RabbitMQ
#set the startup command to be rabbit
CMD ["c:/rabbitmq/sbin/rabbitmq-server.bat"]

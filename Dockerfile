FROM        java:7-jdk

ENV         JAVA_HOME         /usr/lib/jvm/java-7-openjdk-amd64
ENV         GLASSFISH_HOME    /usr/local/glassfish3
ENV         PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

ENV         ADMIN_USER        admin
ENV         ADMIN_PASSWORD    admin123
ENV         PASSWORDFILE      $GLASSFISH_HOME/bin/passwordfile

#update and install linux apps
RUN         apt-get update && \
            apt-get install -y curl unzip zip inotify-tools && \
            rm -rf /var/lib/apt/lists/*


# download and unzip glassfish
RUN         curl -L -o /tmp/glassfish-3.1.2.2.zip https://download.oracle.com/glassfish/3.1.2.2/release/glassfish-3.1.2.2.zip && \
unzip /tmp/glassfish-3.1.2.2.zip -d /usr/local && \
rm -f /tmp/glassfish-3.1.2.2.zip

# prepare password file

RUN         echo 'AS_ADMIN_PASSWORD=\n\
AS_ADMIN_NEWPASSWORD='$ADMIN_PASSWORD'\n\
EOF\n'\
>> /tmp/tmpfile

RUN echo 'AS_ADMIN_PASSWORD='$ADMIN_PASSWORD'\n\
EOF\n'\
>> $PASSWORDFILE

            #change password
RUN         $GLASSFISH_HOME/bin/asadmin start-domain && \
$GLASSFISH_HOME/bin/asadmin --user $ADMIN_USER --passwordfile=/tmp/tmpfile change-admin-password && \
$GLASSFISH_HOME/bin/asadmin --user $ADMIN_USER --passwordfile=$PASSWORDFILE enable-secure-admin && \
$GLASSFISH_HOME/bin/asadmin restart-domain

# cleanup
RUN         rm /tmp/tmpfile


EXPOSE      8080 4848 8181 9009

WORKDIR     /usr/local/glassfish3

# verbose causes the process to remain in the foreground so that docker can track it
CMD         asadmin start-domain --verbose
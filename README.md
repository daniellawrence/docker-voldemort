Getting started
------------------

Start a voldemort single instance server

    $ docker build -t voldemort .
    $ docker run -d --name voldemort -t voldemort

Start another instance, that we can use as a client

    $ docker run -i --link=voldemort:voldemort -t voldemort \
            ./bin/voldemort-shell.sh test tcp://voldemort:6666

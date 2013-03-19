From: Shawn J. Goff <shawn7400@gmail.com>
Date: Tue, 19 Mar 2013 18:21:30 -0400
Subject: [Buildroot] Trouble linking libroxml
Message-ID: <CAGiDA6+wP_PEqQ0SvLO6EUng0fkH2FH-hFvPyBYcNLa1yaTHXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to link use libroxml, but I'm getting errors like this:

    undefined reference to `roxml_load_buf(char*)'

The compiler line looks like this:

    arm-unknown-linux-gnueabi-g++   main.o debug.o modem.o mutex.o
qmodem.o serial.o util.o -lusb -lrt -lpthread -lm -lcurl -lroxml -o
modem-monitor

libroxml.so is built and in the target and the sysroot, and
arm-unknown-linux-gnueabi-nm shows the symbol is present.


Is there anything else I might be missing?

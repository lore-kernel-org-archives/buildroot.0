From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Tue, 24 May 2016 17:52:45 +0530
Subject: [Buildroot] startx error
Message-ID: <CAG7w3y=axgJ1Gmess405FtXm9CCaLX91HBKrN=Pk-SxoxkYhsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

when i run an X server( "startx" command) it show some error

# startx

expr: warning: '^/dev/tty[0-9]\+s': using '^' as the first character of
basic regular  expression is not portable;
it is ignored

xauth: file /root/.serverauth.123 does not exist

xinit: unable to run server "/usr/bin/x": no such file or directory use the
--option, or make sure that /usr/bin is in your path and
that "/usr/bin/x" is aprogram or link to the rigth type of server for your
display.

possible sarver names include

xorg     common x server for most display
xvfb     virtual frame buffer
xfake     kdrive-based virtual frame buffer
xnest     x server nested in a window on another x window
xephyr     kdrive-based nested xserver
xvnc     xsever accessed over vnc
xdmx     distributed multi-head xserver

xinit : giving up
xinit : unable to connect to x server : connection refused
xinit : server error

i dont know where i made mistake please help me to solve this problem

thank you
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160524/da86414d/attachment.html>

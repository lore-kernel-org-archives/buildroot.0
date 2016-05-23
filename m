From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Mon, 23 May 2016 18:24:34 +0530
Subject: [Buildroot] GTK NOT WORKING
Message-ID: <CAG7w3ykc6-Uc-aXWbabxBPVyJKVoA=gjz+0O6xCWaqJTcBGyYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

     i have working with buildroot for raspberry pi i want to run gtk3+
based application, i alredy selected libgtk3 and build successfully when i
run demo application i got the following warning message

Unable to init server: could not connect : connection refused

(gtk3-demo :136) : Gtk-warning **: cannot open display

after this warrning message i have select some packages under,

target packages---->
         |
    |------>Graphic libraries and application
        |
        |---------->x.org xwindow system
                |
                |-------->xorg server
                    |
                    |---> x window system system type
                                (modular x.org)


but i got following error

Making all in xwayland
  CC       Xwayland-xwayland.o
xwayland.c:33:26: fatal error: compositeext.h: No such file or directory
 #include <compositeext.h>
                          ^
compilation terminated.
make[4]: *** [Xwayland-xwayland.o] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all-recursive] Error 1
make[1]: ***
[/home/malar/Documents/build_root/buildroot/output/build/xserver_xorg-server-1.18.3/.stamp_built]
Error 2
make: *** [_all] Error 2

when i unselect "x.org server" that compile good

i dont need any desktop environment i want to run only gtk3 based
application, i don't know which are the packages are need to run the gtk
application. i have working last three days i didn't get any improvement


i am beginner to buildroot kindly help me to resolve this problem


thank you ,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160523/f6bc2c71/attachment.html>

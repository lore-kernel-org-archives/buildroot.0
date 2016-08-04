From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 4 Aug 2016 14:04:42 +0200
Subject: [Buildroot] Problem compiling Xorg with buildroot
Message-ID: <CALtfCQadUrgN48ZeLoK1_1uSET91==xaGUVdV5Lv+iurUifRag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I've just compiled a buildroot for raspberrypi 2B with Qt5 and Xorg server.

I realised that after compile Xorg server it appears a new directory in
home buildroot folder:

../output/target/home/oscargomez/GIT/buildroot-2016.02/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/xorg

And this folder contains the following files:

-rw-r--r-- 1 oscargomez oscargomez 3585 ago  4 13:31 evdev-properties.h
-rw-r--r-- 1 oscargomez oscargomez 4868 ago  4 13:31 joystick-properties.h
-rw-r--r-- 1 oscargomez oscargomez 6415 ago  4 13:31 libinput-properties.h
-rw-r--r-- 1 oscargomez oscargomez 5918 ago  4 13:32 synaptics-properties.h
-rw-r--r-- 1 oscargomez oscargomez 1489 ago  4 13:31 xf86-mouse-properties.h

As you know oscargomez is my host user, so I don't understand what's happen.

Does anyone know what happens?

Oscar Gomez Fuente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160804/7565408e/attachment.html>

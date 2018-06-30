From: Ola Oni <oniola@gmail.com>
Date: Sat, 30 Jun 2018 16:23:49 +0100
Subject: [Buildroot] Beaglebone_qt5_defconfig (Beaglebone Black)
Message-ID: <CAPru4TU0nZ4DbQu1_PGmUiEcUijy1uRr3WHeXw-cCjsM23QMmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
I am not sure if this is the correct place to ask for help but I am kind of
desperate and totally clueless on where else to turn to.

I am new to using buildroot and to a greater extent embedded Linux but I
have many years of Electronics and embedded firmware development on metal
to metal programming with or without RTOS.

However for number of weeks considering that I really only have Saturdays
to really play with these kits. I have been struggling to get Qt5 GUI
application running on an 7 Inch LCD screen for 4D System
<https://www.4dsystems.com.au/product/4DCAPE_70T/>

I am currently using the attached beaglebone_qt5_defconfig I learnt from
someone on the IRC channel that this is more likely a OpenGL issue rather
than buildroot issue but I don't know how to go about solving this issue.

Using the attached defconfig I can build a rootfs, kernel and toolchains
that run fine on the BBB. I can even run console executables however when I
try to run any GUI based executable I get the following error ...

/usr/lib/qt/examples/gui/analogclock
# ./analogclock -platform eglfs
PVR:(Error): WSEGL_InitialiseDisplay: Failed to create output [0, ]
Could not initialize egl display
Aborted

With the same hardware I am able to flash a Debian image that runs okay
with the 7 inch LCD display.
I do however really want this to work under buildroot as I am planing to
use it as my main build-system of choice as I migrate into the embedded
Linux world.

Someone also for the IRC channel suggested that I startup the with the
Debian image and then try to chroot into the buildroot file system. This I
did but still did not allow me to run any GUI applications.

Any help will be appreciated. Many thanks in advance.

Regards

onio
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180630/cc72fea9/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: beaglebone_qt5_defconfig
Type: application/octet-stream
Size: 1739 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180630/cc72fea9/attachment.obj>

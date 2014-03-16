From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 16 Mar 2014 15:38:29 +0100
Subject: [Buildroot] Error building qt5base
Message-ID: <5325B765.4000506@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
with the latest buildroot version (2014.05-git-00342-g9b4696a) and the 
attached .config file I get errors when building qt5base. The first 
error is:

In file included from 
/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/X11/Xlib.h:44:0,
                  from 
/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglvivante.h:222,
                  from 
/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglplatform.h:38,
                  from 
/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/egl.h:34,
                  from qeglfsscreen.h:49,
                  from qeglfsintegration.h:45,
                  from qeglfsintegration.cpp:42:
../../../../include/QtCore/../../src/corelib/io/qurl.h:139:9: error: 
expected identifier before numeric constant
          None = 0x0,
          ^


How to find out what is wrong in my configuration?
Thanks
Marco

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 48513 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140316/ff26b71f/attachment.wsdl>

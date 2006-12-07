From: Rafael A Barrero <rafa@linux.it>
Date: Thu, 7 Dec 2006 14:03:37 -0800
Subject: [Buildroot] udev make errors
Message-ID: <3662182B-2B05-4C74-94FC-15AA4864BCB9@linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

I'm having problems going through the install of udev-100. After it  
builds properly, I get these errors:

// BEGIN FILE //
....
   LD       udevmonitor
   CC       udevinfo.o
   LD       udevinfo
   CC       udevtest.o
   LD       udevtest
   CC       udevstart.o
   LD       udevstart
make[1]: Leaving directory `/root/src/buildroot/build_i686/udev-100'
touch -c /root/src/buildroot/build_i686/udev-100/udev
mkdir /root/src/buildroot/build_i686/root/sys
mkdir /root/src/buildroot/build_i686/root/etc/udev/rules.d
mkdir: cannot create directory `/root/src/buildroot/build_i686/root/ 
etc/udev/rules.d': No such file or directory
make: [/root/src/buildroot/build_i686/root/sbin/udev] Error 1 (ignored)
/usr/bin/install -D -m 0644 /root/src/buildroot/build_i686/udev-100/ 
etc/udev/frugalware/* \
                 /root/src/buildroot/build_i686/root/etc/udev/rules.d
/usr/bin/install: target `/root/src/buildroot/build_i686/root/etc/ 
udev/rules.d'
is not a directory
make: *** [/root/src/buildroot/build_i686/root/sbin/udev] Error 1
[root at host buildroot]#
// END OF FILE //

Thanks,

Rafael.

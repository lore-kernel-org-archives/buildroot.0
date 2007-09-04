From: Carl Davis <gearthbeta@gmail.com>
Date: Tue, 4 Sep 2007 16:50:05 -0700
Subject: [Buildroot] buildroot: busybox_unstripped: no such file or directory
Message-ID: <a57326e40709041650u10522899r5d4498e020cf9f25@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build an embedded system using buildroot-20070829,
everything builds fine except for busybox-*any*, instead I get the
following error:

/devel/buildroot/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'busybox_unstripped': No such file
install: cannot stat `busybox': No such file or directory
make[1]: *** [install] Error 1

I have a small feeling that it make be the mk file as I am able to
build busybox-*any* using the uClibc 'fakeroot' but I prefer to cross
compile rather than chroot.

Any thoughts and/or ideas would be greatly appreciated.
Thanks in advance.

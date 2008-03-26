From: laura vansen <laurenvansen@gmail.com>
Date: Tue, 25 Mar 2008 23:11:19 -0500
Subject: [Buildroot] uclibc kernel out of sync?
Message-ID: <23dbae050803252111o31e409b7of2648d8515009991@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am trying to compile a userspace program that uses I2C.
I am getting an error for conflicting types for timer_t which is declared in
time.h and linux/types.h .  How do I resolve this?
 Are the version of uclibc and the kernel headers im using incompatible?
I am using the default uclibc in buildroot and 2.6

In file included from
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/pthread.h:21,
                 from
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/bits/uClibc_mutex.h:15,
                 from
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/bits/uClibc_stdio.h:119,
                 from
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/stdio.h:72,
                 from main.c:3:
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/time.h:105:
error: conflicting types for 'timer_t'
/home/x/Desktop/omap/new/buildroot/build_arm/staging_dir/usr/include/linux/types.h:22:
error: previous declaration of 'timer_t' was here
x at xubunt:~/Desktop/omap/i2ctesto$

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080325/9880b008/attachment.htm 

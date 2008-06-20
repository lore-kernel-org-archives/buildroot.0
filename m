From: Fathi Boudra <fboudra@gmail.com>
Date: Fri, 20 Jun 2008 22:13:39 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <200806202050.32567.fboudra@gmail.com>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
	<87r6as2c0o.fsf@macbook.be.48ers.dk>
	<200806202050.32567.fboudra@gmail.com>
Message-ID: <6a2e33620806201313h2ceb6b6yfebe620f4ef3c2d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

using --disable-decimal-float workaround the issue.

uclibc fails to build later:

  CC libc/sysdeps/linux/common/chdir.os
In file included from ./include/sys/param.h:22,
                 from libc/sysdeps/linux/common/chdir.c:13:
./include/limits.h:124:26: error: limits.h: No such file or directory
make[2]: *** [libc/sysdeps/linux/common/chdir.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080620/a968e758/attachment.htm 

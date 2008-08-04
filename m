From: Andrew Ma <andrewma83@hotmail.com>
Date: Mon, 4 Aug 2008 11:05:59 -0700
Subject: [Buildroot] many "/etc/mdev.conf: No such file or directory" when
	boot up
Message-ID: <386b1f6d0808041105t574c48fcsc83eee2d2b9e4bfb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have compiled and make a very simple (no optional package) ISO rootfs
image for x86.  I see many of these mdev.conf messages.  I have seen some
other thread or post mention to copied mdev.conf from other target to
"target/generic/target_skeleton/etc/".  However, that would cause some
messages like "cannot find tty[2-4]". Is there a correct way to solve this
"mdev.conf" error messages ?

P.S. I am using Virtual box for emulation.
Thanks
--Andrew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080804/715d819b/attachment.htm 

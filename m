From: Lee JJ <jengjr@gmail.com>
Date: Fri, 29 Jun 2007 14:37:18 +0800
Subject: [Buildroot] syslinux.mk & bzip2 errors, modification
Message-ID: <1497cb6d0706282337g19372f54t3275752462df147e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry , this may already appear somewhere else
PLS forgive to bother you

1
buildroot/target/x86/syslinux/syslinux.mk

SYSLINUX_SITE=http://www.kernel.org/pub/linux/utils/boot/syslinux/Old<---Old
now the web director change to "Old"

2.
cp /root/buildroot/build_i686/bzip2-1.0.3/bzlib.h
/root/buildroot/build_i686/staging_dir/include/
cp: cannot create regular file
`/root/buildroot/build_i686/staging_dir/include/bzlib.h': No such file or
directory

buildroot/build_i686/staging_dir/"include/" <--- do not know where is the
script error
have to create the "include" directory by hand

Cheers
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070629/d697ae3d/attachment.htm 

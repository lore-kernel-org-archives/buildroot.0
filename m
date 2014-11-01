From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:39:57 +0100
Subject: [Buildroot] Samba4 build issue
Message-ID: <20141101233957.7ca9aabd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

A build issue is affecting Samba 4, apparently on many
architectures/toolchains:

   http://autobuild.buildroot.org/?reason=samba4-4.1.13

The error message seems to be more or less always the same:

/home/peko/autobuild/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/xattr.h:32:3: error: expected identifier before numeric constant
   XATTR_CREATE = 1, /* set value, fail if attr already exists.  */
   ^

Is this some new kernel headers dependency? Dependency on the attr
package?

If you could have a look, it would be great.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

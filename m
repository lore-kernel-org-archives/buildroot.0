From: MALEADt <maleadt@gmail.com>
Date: Thu, 11 Sep 2008 14:53:39 +0200
Subject: [Buildroot] Missing binaries
Message-ID: <1221137619.9222.1.camel@tim-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been working with buildroot lately, and every time I created a
toolchain, several binaries seemed to be missing. These binaries
included: tar, xargs, sed, mount & umount.

As it seems, these binaries all get properly compiled, but just not
included in the final filesystem. I only needed to copy them from the
somewhere in the build_xxx folder, to the toolchain.

Is this a problem of mine, or is anybody else experiencing this problem?
It happens with the newest SVN build, when compiling a bash system (no
busybox) with all mentioned utilities specifically enabled in the
configuration.

Thanks,
maleadt

From: Jerry Richards <jerryr@tonecommander.com>
Date: Fri, 13 Jul 2007 09:02:09 -0700
Subject: [Buildroot] Building debug version of kernel
Message-ID: <000601c7c567$2bbcdf10$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is editing the top-level Linux Makefile the standard method for my host
machine to build a debug version (i.e. with "-g -O0" CFLAGS) of the Linux
2.6 kernel?  If so, should I make these flag changes to CFLAGS_KERNEL or
HOSTCFLAGS or both?

The build output only shows the format "CC <object-file-name>" without
flags, so I can't see what it's actually doing.

Best Regards,
Jerry

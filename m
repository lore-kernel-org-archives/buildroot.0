From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Fri, 04 May 2007 22:10:04 -0500
Subject: [Buildroot] Question on UCLIBC_CONFIG_FILE usage.
Message-ID: <463BF58C.6010602@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am obviously missing something here. If I do not specify UCLIBC_CONFIG_FILE
on the command line to make, then a config file in 'toolchain/uClibc' will be
used. None of the values assigned to it in the target directories will ever
be picked up because the top-level Makefile does 'include target/Makefile.in'
last which is too late for 'toolchain/uClibc/uclibc.mk' to pick up the value
in a target-specific directory. Anyone care to comment? Thanks.

-Steve

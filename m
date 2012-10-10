From: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Date: Thu, 11 Oct 2012 00:41:29 +0200
Subject: [Buildroot] Error with external mips toolchain
Message-ID: <5075F999.7000709@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Using Cavium's toolchain I get "Incorrect selection of the C library", 
because the helper.mk can't find ld.linux in $SYSROOT/lib/.
But in this toolchain ld.linux can be found in $SYSROOT/lib64 or 
$SYSROOT/lib32 only. How to workaround this check?

And maybe related, how to tune cpu cflags like -mabi or -march,
I have seen BR2_TARGET_LDFLAGS, but no BR2_TARGET_LDFLAGS.

Thanks,
Jean-Mickael

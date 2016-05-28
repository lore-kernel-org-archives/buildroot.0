From: Roland Franke <fli4l@franke-prem.de>
Date: Sat, 28 May 2016 13:40:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] rrdtool: bump version to 1.6.0
In-Reply-To: <20160511231211.1a1bd0c2@free-electrons.com>
References: <1462976617-24524-1-git-send-email-fli4l@franke-prem.de><1462976617-24524-2-git-send-email-fli4l@franke-prem.de>
 <20160511231211.1a1bd0c2@free-electrons.com>
Message-ID: <099152E77C184E7AA62887CAF1DE72FC@ROLANDAMD64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo,

>> -RRDTOOL_AUTORECONF = YES
>> -RRDTOOL_GETTEXTIZE = YES

> If anything, this should be done as part of the patch bumping to
> version 1.6.0. I.e, your two patches should be merged into just one.

Sorry for my mistake. But as you reported the following error:

> Also, this breaks the build for me, as I just reported on the v1 of
> your patch:
> /home/test/outputs/rrdtool/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/../../../../arm-buildroot-linux-
> uclibcgnueabi/bin/ld: rrd_tool.o: undefined reference to symbol 
> 'libintl_gettext'
> /home/test/outputs/rrdtool/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so.8: 
> error adding symbols: DSO missing
> from command line

But you have reported that you have for that fault also switch off the 
variables
RRDTOOL_AUTORECONF and RRDTOOL_GETTEXTIZE.

So why cannot be used the first version or by the second version only
part 1/2 of this patch?
Same was asked already from Alexander Dahl?
But there was no replay to him.

Best regards,
Roland Franke 

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 09:50:13 +0200
Subject: [Buildroot] blktrace fails to build on ARC
Message-ID: <20180913095013.5f9ae2da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ARC maintainers,

I don't know if you have noticed, but the blktrace package fails to
build on ARC, since quite some time:

  http://autobuild.buildroot.net/?reason=blktrace-1.%

There is a toolchain issue:

/home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: btreplay: hidden symbol `__st_r13_to_r17' in /home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/libgcc.a(_millicodethunk_st.o) is referenced by DSO
/home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: Bad value

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

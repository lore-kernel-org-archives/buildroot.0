From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:11:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: add Libs.private to
 libraw.pc
In-Reply-To: <20210602061019.749260-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Jun 2021 08:10:19 +0200")
References: <20210602061019.749260-1-fontaine.fabrice@gmail.com>
Message-ID: <8735tpjx8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add Libs.private to libraw.pc to fix the following static build failure
 > with imagemagick which is raised since commit
 > 2f47cfade4b298350d056f6d9a7525b837e2ba23:

 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o):
 > in function `jpg_encode':
 > jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

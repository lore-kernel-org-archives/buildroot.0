From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 19:16:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/tar: Depends on MMU
In-Reply-To: <1407590919-23046-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 9 Aug 2014 15:28:39 +0200")
References: <1407590919-23046-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87tx5d1xni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > misc.o: In function `_xfork':
 > misc.c:(.text+0x614): undefined reference to `_fork'
 > ../lib/libtar.a(rtapelib.o): In function `_rmt_open__':
 > rtapelib.c:(.text+0x6d2): undefined reference to `_fork'

 > To reproduce use this defconfig
 > http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard

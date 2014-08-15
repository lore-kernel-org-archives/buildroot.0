From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:34:57 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_rstart: Depends on MMU
In-Reply-To: <1407591275-8281-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sat, 9 Aug 2014 15:34:35 +0200")
References: <1407591275-8281-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <874mxd1iwe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 >   CCLD   rstartd.real
 > auth.o: In function `_do_auth':
 > auth.c:(.text+0x6a): undefined reference to `_fork'
 > server.o: In function `_detach':
 > server.c:(.text+0x80a): undefined reference to `_fork'

 > To reproduce use this defconfig
 > http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard

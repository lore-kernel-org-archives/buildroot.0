From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 17:03:35 +0200
Subject: [Buildroot] [PATCH 1/2] olimex_a20_olinuxino_micro: bump to
	U-Boot 2017.5 and fix build
In-Reply-To: <1499809086-3174-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 11 Jul 2017 23:38:05 +0200")
References: <1499809086-3174-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87vamxpuig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > This defconfig does not build anymore since commit
 > 6cda724efb20682bb98e6d738e5f7c909415ae07 ("package/gcc: switch to gcc
 > 6.x as the default"). Fix by upgrading to the latest U-Boot version.

 > Fixes:
 >   In file included from include/linux/compiler.h:54:0,
 >                    from include/linux/bitops.h:5,
 >                    from ./include/common.h:20:
 >   include/linux/compiler-gcc.h:114:30: fatal error: linux/compiler-gcc6.h: No such file or directory
 >    #include gcc_header(__GNUC__)
 >                                 ^
 >   compilation terminated.

 > [Build- and run-tested]
 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard

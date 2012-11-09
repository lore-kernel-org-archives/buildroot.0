From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 09:14:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-11-08
In-Reply-To: <CAGm1_kt9vX6NvVXxSESARNAVbgLA0kMjFx61hzvg+B7HtnRkeg@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 9 Nov 2012 08:46:32 +0100")
References: <20121109073404.B9B4552C106@lolut.humanoidz.org>
 <CAGm1_kt9vX6NvVXxSESARNAVbgLA0kMjFx61hzvg+B7HtnRkeg@mail.gmail.com>
Message-ID: <874nkz8a77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 >> Build 6b6c23641e5e166f15142d6127029314c91d87a2
 >> ==============================================
 >> 
 >> Status         : NOK
 >> Failure reason : xapp_mkfontdir-1.0.7
 >> Architecture   : arm
 >> Submitted by   : Peter Korsgaard (gcc10)
 >> Submitted at   : 2012-11-08 01:33:06
 >> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d727a4da444cb0001f8b5f73e73809780542be65
 >> End of log     : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/build-end.log
 >> Complete log   : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/build.log.bz2
 >> Configuration  : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/config
 >> Defconfig      : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/defconfig

 Yegor> Just tried "wget
 Yegor> http://xorg.freedesktop.org/releases/individual/app/mkfontdir-1.0.7.tar.bz2"
 Yegor> and had no problems.

Probably it was just a temporary issue with freedesktop.

 Yegor> Btw have you tried to compile xdm with the latest
 Yegor> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203=y for OMAP3? gcc
 Yegor> consumes 100% CPU time but build/link process doesn't advance. With
 Yegor> the previous toolchain version xdm has no problems, but alsamixer
 Yegor> shows run-time error related to libc. Haven't tested the stuff with
 Yegor> Linaro toolchain yet.

:/ No I haven't.

-- 
Bye, Peter Korsgaard

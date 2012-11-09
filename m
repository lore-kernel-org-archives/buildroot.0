From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Nov 2012 08:46:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-11-08
In-Reply-To: <20121109073404.B9B4552C106@lolut.humanoidz.org>
References: <20121109073404.B9B4552C106@lolut.humanoidz.org>
Message-ID: <CAGm1_kt9vX6NvVXxSESARNAVbgLA0kMjFx61hzvg+B7HtnRkeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Build 6b6c23641e5e166f15142d6127029314c91d87a2
> ==============================================
>
> Status         : NOK
> Failure reason : xapp_mkfontdir-1.0.7
> Architecture   : arm
> Submitted by   : Peter Korsgaard (gcc10)
> Submitted at   : 2012-11-08 01:33:06
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d727a4da444cb0001f8b5f73e73809780542be65
> End of log     : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/config
> Defconfig      : http://autobuild.buildroot.net/results/6b6c23641e5e166f15142d6127029314c91d87a2/defconfig

Just tried "wget
http://xorg.freedesktop.org/releases/individual/app/mkfontdir-1.0.7.tar.bz2"
and had no problems.

Btw have you tried to compile xdm with the latest
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203=y for OMAP3? gcc
consumes 100% CPU time but build/link process doesn't advance. With
the previous toolchain version xdm has no problems, but alsamixer
shows run-time error related to libc. Haven't tested the stuff with
Linaro toolchain yet.

Yegor

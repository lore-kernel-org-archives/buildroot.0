From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 02 Dec 2012 13:53:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-11-29
In-Reply-To: <20121130073328.24CF052C08B@lolut.humanoidz.org>
References: <20121130073328.24CF052C08B@lolut.humanoidz.org>
Message-ID: <50BB4F67.4010002@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.11.2012 08:33, schrieb Thomas Petazzoni:
> Build 0083137d721a505f79ae7940ef57f94417035b00
> ==============================================
>
> Status         : NOK
> Failure reason : qtuio-abe4973ff6
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-11-29 23:30:51
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=7c9549e84f80d66fcb685a9f2c9b8e44e086c883
> End of log     : http://autobuild.buildroot.net/results/0083137d721a505f79ae7940ef57f94417035b00/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/0083137d721a505f79ae7940ef57f94417035b00/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/0083137d721a505f79ae7940ef57f94417035b00/config
> Defconfig      : http://autobuild.buildroot.net/results/0083137d721a505f79ae7940ef57f94417035b00/defconfig
Hello all,

this fauilure is caused by a missing #include in the source code. I
reported it upstream, but there are no changes since 2 years.

A patch to fix this issue follows.

Kind Regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

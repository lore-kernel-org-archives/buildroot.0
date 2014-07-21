From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 21 Jul 2014 14:16:00 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-20
In-Reply-To: <20140721121553.10be890c@free-electrons.com>
References: <20140721063011.48A3410123E@stock.ovh.net>
 <20140721121553.10be890c@free-electrons.com>
Message-ID: <201407211416.00389.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On Monday 21 July 2014 13:15:53 Thomas Petazzoni wrote:
> >        arm |            qt5multimedia-5.3.1 | NOK |
> >http://autobuild.buildroot.net/results/b975c4bb8aebad2d0b8eaefc98c42c0460
> >ace5be/ mips64el |            qt5multimedia-5.3.1 | NOK |
> >http://autobuild.buildroot.net/results/b1ca9c845f1cf3a396cbd7ad81bfc44119
> >74c709/
> 
> [7m>>> qt5multimedia 5.3.1 Installing to target[27m
> cp -dpfr
> /home/test/autobuild/instance-3/output/host/usr/arm-buildroot-linux-gnueab
> ihf/sysroot/usr/qml/* /home/test/autobuild/instance-3/output/target/usr/qml
> cp: cannot stat
> `/home/test/autobuild/instance-3/output/host/usr/arm-buildroot-linux-gnuea
> bihf/sysroot/usr/qml/*': No such file or directory
> 
> Fatih?
> 
> It might be related to the fact that I haven't applied your entire
> patch series.. but it would mean that your series was not
> bisectable! :-)

Sorry, the first patch in my series introduced this issue. I will send another 
patch which is based on my series.

Sometimes I forget removing output directory before testing a different config 
(building qt5multimedia w/o qt5declarative in this case).

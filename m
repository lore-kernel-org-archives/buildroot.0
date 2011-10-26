From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 26 Oct 2011 17:01:53 +0200
Subject: [Buildroot] Qt program with GUI issue
In-Reply-To: <4EA8042B.2050501@visionsystems.de>
References: <4EA8042B.2050501@visionsystems.de>
Message-ID: <4EA820E1.8060403@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.10.2011 14:59, schrieb Yegor Yefremov:
> I'm trying to get my program integrated into BR. So far I managed to successfully build and install it, but as soon as I run it (with -qws option) I get trouble:
> 
> GUI will be shown, but at the same time background/wallpaper goes green (I made nothing to make this happen). When I move my mouse, the pointer seems to draw over GUI, so that real gray background will show up at the places where mouse pointer went through.
> 
> Is there any simple QT based project I could try to integrate as a reference? I tried CuteCom, but it is fully Qt4 compatible.
> 
> Another issue if I don't supply -qws param, I get following error messages:
> 
> QWSSocket::connectToLocalFile could not connect:: No such file or directory
> 
> My system:
> ARM Cortex-A8
> WindowsManager: Fluxbox

I managed to get RenameX (http://dev.creabox.biz/RenameX/index.php) compiled, but when started I get the same result. 

So I think it has something to do with an interface between Qt and X11. Can someone, who managed to create/use a Qt based graphical application, share his/her experience/.config?

Regards,
Yegor

From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 07 Oct 2012 16:00:58 +0200
Subject: [Buildroot] Kernel sources supplied from my PC
In-Reply-To: <507183A5.4010006@ronetix.at>
References: <507183A5.4010006@ronetix.at>
Message-ID: <50718B1A.4060804@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try the source directory override explained here:
http://free-electrons.com/blog/buildroot-2011-11/

Obviously, this didn't make it into the manual yet;-(

Am 07.10.2012 15:29, schrieb Martin Peevski:
> Hello, I want to ask you how can I supply some of the needed sources
> for building Linux system from my PC? This is because sometimes I
> haven't server with some custom Kernel version, for example, and have
> only my PC.
>
> I search in the manual and there have section "Offline builds" but it
> can't help me, I think? When I execute make source the needed sources
> will be downloaded from internet again?
>
> I think that I can copy my sources to /dl directory of Buildroot but
> when execute make distclean it dissapear. Or I must create it manualy
> and then copy my sources there?
>
> Thanks in advance!
> Martin.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

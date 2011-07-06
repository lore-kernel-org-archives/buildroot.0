From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2011 08:51:40 +0200
Subject: [Buildroot] [PATCH] new package: libav
In-Reply-To: <87k4bwuh1x.fsf@macbook.be.48ers.dk>
References: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
 <20110705224642.4953b847@skate>
 <87k4bwuh1x.fsf@macbook.be.48ers.dk>
Message-ID: <20110706085140.749b6388@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 06 Jul 2011 07:14:18 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I haven't followed the libav discussions in detail - Is it (currently) a
> 100% drop in replacement for ffmpeg? If so, perhaps we should handle it
> like the modular/tinyx selection for the X server. If not, I think it
> should be two completely independent packages.

My understanding is that libav is a fork of ffmpeg. So, it will
probably become more and more different than ffmpeg, in which case
separate packages are obviously the right way of handling this.

In the mean time, as they are exactly similar (at least in terms of
build mechanism and options), I wanted to suggest doing a modular/tinyx
style of selection. We might switch to a separate package when needed.
But on the other hand, having a separate package is probably more clear.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

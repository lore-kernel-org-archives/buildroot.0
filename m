From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 2 Jul 2013 15:21:45 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-01
In-Reply-To: <20130702093852.123fdc11@skate>
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
 <20130702093852.123fdc11@skate>
Message-ID: <CALR4fEL=6vPWnZTxRzcY-1tmYNjkbn2K=oVauCxAee1bKhZ0eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW, do we test that the images run? I was unable to test the default arm
versatile image on QEmu (qemu fails loading).


On Tue, Jul 2, 2013 at 10:38 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Peter,
>
> On Tue,  2 Jul 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:
>
> > Classification of failures by reason
> > ====================================
> >
> >         ltp-testsuite-20130109 | 8
>
> Can you adjust your build script to not build ltp-testsuite when using
> uClibc? It is well known that our default uClibc configuration doesn't
> have all the necessary bits to build ltp-testsuite.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130702/32e48a4c/attachment.html>

From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Mon, 7 Jun 2010 17:37:28 +0800
Subject: [Buildroot] Package conversion for 2010.08
In-Reply-To: <20100607111716.26033337@surf>
References: <20100530123655.6cffcc8c@surf> <20100607111716.26033337@surf>
Message-ID: <AANLkTikURmMB185MTpfck7BHOTSjvXcBQ7q86cEqrryU@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

The following packages were converted by me:

axel (https://bugs.busybox.net/show_bug.cgi?id=1723)
mplayer (https://bugs.busybox.net/show_bug.cgi?id=1735)
lmbench (https://bugs.busybox.net/show_bug.cgi?id=1753)
transmission (https://bugs.busybox.net/show_bug.cgi?id=743)

Could you check them?
Thanks!


2010/6/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> On Sun, 30 May 2010 12:36:55 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
> >  * file
>
> Conversion done by Gustavo Zacarias. To be merged.
> https://bugs.busybox.net/show_bug.cgi?id=1927
>
> >  * gawk
>
> Conversion done by Gustavo Zacarias. To be merged.
> https://bugs.busybox.net/show_bug.cgi?id=1933
>
> >  * module-init-tools
>
> I have a converted package in my linux-cleanup branch. Will be
> submitted as part of this work.
>
> >  * modutils
>
> Removed. Was only needed for 2.4 kernels.
>
> >  * pciutils
>
> Already converted (false positive in my script).
>
> >  * rp-pppoe
>
> Package to drop, no longer needed. According to Gustavo, ppp includes a
> plug-in that does the same thing.
>
> >  * tn5250
>
> Conversion done by Gustavo Zacarias. Merged.
>
> All other packages still require some love :-)
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100607/a43f1f1b/attachment.html>

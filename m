From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 6 Nov 2016 13:07:33 +0100
Subject: [Buildroot] qmx6_defconfig fails to build
In-Reply-To: <CAAMH-ysBQp=NS8yo7k1N9AuTeUK88ynoyM7b_50LorY+mwDBQA@mail.gmail.com>
References: <20161105150405.705835a4@free-electrons.com>
 <388a11fc-6093-a4cb-c499-e264acb9250e@relinux.de>
 <CAAMH-ysz=Z41ks2cEXQG2S4PRPJ58GJYDy8Ss=gL9k0T6kwQiA@mail.gmail.com>
 <CAAMH-ysBQp=NS8yo7k1N9AuTeUK88ynoyM7b_50LorY+mwDBQA@mail.gmail.com>
Message-ID: <CAAMH-yvrhaxK5yPa6dy4wWHk3c1tPvL3w=DZ-tGTCkjXxMxqjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

Same here, don't have any qmx6 hardware. I've bumped the kernel in the past
looking at their repo tags but I think they now moved to another repo.

Regards,
Gary

Le 5 nov. 2016 3:58 PM, "Stephan Hoffmann" <sho@relinux.de> a ?crit :

Hello Thomas,

unfortunatelly, I do not have access to a qmx6 hardware anymore.

Kind regards

Stephan

Am 05.11.2016 um 15:04 schrieb Thomas Petazzoni:
> Stephan, J?r?me, Gary,
>
> All of you have touched the qmx6_defconfig in Buildroot: Stephan is the
> original submitter (in 2014), J?r?me did some improvements in April
> 2015, and then Gary updated the kernel version two times in 2015.
>
> However, today, this defconfig fails to build, because the U-Boot
> version being used is too old to build with gcc 5.x.
>
> If you still have access to the HW, could you submit a patch that
> updates the defconfig to make it build with gcc 5.x ?
>
> See the full build log at
> http://free-electrons.com/~thomas/pub/buildroot-
defconfigs/qmx6_defconfig.log.FAIL.
>
> Thanks!
>
> Thomas


--
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161106/e122874c/attachment.html>

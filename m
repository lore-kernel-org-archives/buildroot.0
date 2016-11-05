From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 5 Nov 2016 15:58:52 +0100
Subject: [Buildroot] qmx6_defconfig fails to build
In-Reply-To: <20161105150405.705835a4@free-electrons.com>
References: <20161105150405.705835a4@free-electrons.com>
Message-ID: <388a11fc-6093-a4cb-c499-e264acb9250e@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/qmx6_defconfig.log.FAIL.
>
> Thanks!
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de

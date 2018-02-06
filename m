From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue, 6 Feb 2018 11:06:21 +0000
Subject: [Buildroot] [arc-buildroot] Re: [PATCH v2 0/2] Xorg: enable
 Etnaviv support
In-Reply-To: <CAOMZO5AdVkKu8iVcOi1Baw-v5iHgON4MMw7X+cwSNmgVkNrf5w@mail.gmail.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <CAOMZO5AdVkKu8iVcOi1Baw-v5iHgON4MMw7X+cwSNmgVkNrf5w@mail.gmail.com>
Message-ID: <1517915180.2596.6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

> Thanks for this series.
> 
> I would be interested in testing it.
> 
> From your previous version, it looks like you also used a imx6
> wandboard.

Exactly so.

> Could you please share the defconfig changes you did in wandboard and
> also the command lines you used to launch X11?

Sure, in attachment I placed defconfig which I used to run glmark app.
on Wandboard.

Commands:
$ X &
$ export DISPLAY=:0
$ glmark2-es2??

-Evgeniy
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: wandboard_test_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180206/253da0cd/attachment.ksh>

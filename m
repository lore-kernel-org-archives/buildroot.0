From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Fri, 16 Jan 2015 07:07:25 +0000
Subject: [Buildroot] support for cortex m3/m4 with newlib
In-Reply-To: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
References: <CAOudHSX=sc7hwE0PObED1jtDp7pOs-=PPVG_Rsh6+di9iYWojA@mail.gmail.com>
Message-ID: <DB3PR04MB10881DC255B126BDF70B7FCEA4F0@DB3PR04MB108.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

I have some boards from ST (Discovery and Disco), they are base on STM32 processor.
I was thinking about having support of those boards with buildroot, but never find time to check this out.
I know that buildroot has support of Blackfin processors, which are also Cortex M3/M4 based, but don?t know what would be the extra work to port this uClinux support to more Cortex M3/M4 processor.
What are you looking for? Do you plan to add support for uClinux, FreeRTOS, eCos, RTEMS or another operating system (perhaps in-house)?
For which kind of Cortex M3/M4 processor have you done the port?

Regards

Fabrice

Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von Cjw X
Gesendet: Donnerstag, 15. Januar 2015 23:58
An: buildroot at busybox.net
Betreff: [Buildroot] support for cortex m3/m4 with newlib

I've been working on modifying buildroot to support cortex m3/m4 processors against the newlib library.
This way I can use buildroot to build RTOS's for those processors. I've been using buildroot for years to build linux systems and I would like to expand that for the smaller processors with different operating systems.

I am making some progress. The toolchain already works. I'm now starting to go down the road of supporting RTOS's.
I'm going to keep going regardless, but I wanted to check to find out if this interests the community.

Does this interest people?
-Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150116/49edf836/attachment.html>

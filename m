From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 13:43:45 +0100
Subject: [Buildroot] Issues with Freescale defconfigs
In-Reply-To: <CAOMZO5BGHXYKGrWyPsE6o9HZ=iBu86pKSbhXMpwitNXVu15yAA@mail.gmail.com>
References: <20181122104556.1d89c074@windsurf>
 <CAOMZO5BGHXYKGrWyPsE6o9HZ=iBu86pKSbhXMpwitNXVu15yAA@mail.gmail.com>
Message-ID: <20181122134345.10f011c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

Thanks for your feedback!

On Thu, 22 Nov 2018 09:05:30 -0200, Fabio Estevam wrote:

> So the proper fix is to apply either Trent's official fix or my
> workaround to all rel_imx_4.9.x_1.0.0_ga NXP U-Boot users.

The fix from Trent looks like the right thing to do. Can we backport it
for the few boards that are affected, and add the patch in Buildroot ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

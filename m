From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 15:09:51 +0100
Subject: [Buildroot] [PATCH] board: add support for Freescale i.MX6UL
 Evaluation Kit
In-Reply-To: <56A0E50A.2060002@free.fr>
References: <1453300220-29113-1-git-send-email-julien.boibessot@free.fr>
 <20160120211015.79807c32@free-electrons.com>
 <56A0C3B7.40900@free.fr>
 <20160121133257.38d9a56a@free-electrons.com>
 <56A0E50A.2060002@free.fr>
Message-ID: <20160121150951.421a1ec4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jan 2016 15:02:50 +0100, Julien Boibessot wrote:

> >> So I ended up in using i.XM28EVK way of doing
> >> (board/freescale/imx28evk/create-boot-sd.sh).
> >> Do you agree ?
> > genimage is perfectly capable of creating a vfat partition, see
> > board/raspberrypi/genimage-raspberrypi.cfg for an example.
> 
> cool ! Is that new ?

No, I don't think this genimage capability is new. However, what is
rather new is this raspberrypi.cfg configuration in Buildroot.

> No problemo ! Can you recommend a test tool to evaluate Floating point
> performances inside BR ?

Maybe whetstone, but I'm not sure as I've never used it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

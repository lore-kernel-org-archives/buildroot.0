From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Tue, 20 Jan 2015 10:02:21 +0100
Subject: [Buildroot] [PATCH] spidev_test: use the one from the kernel we
 build
In-Reply-To: <20150119213258.GD4217@free.fr>
References: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
 <20150119211348.GC4217@free.fr> <20150119213258.GD4217@free.fr>
Message-ID: <54BE199D.7080006@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/19/2015 10:32 PM, Yann E. MORIN wrote:
..
> Anything I missed?

Hi Yann,

Thanks for your concern.

I am not sure about all those headers and kernel version constrains, sorry.

The point of the proposed patch was more to be able to keep both the
kernel and spidev_test.c in one place, in sync.
  This is especially useful when fiddling into an SPI driver for
example, and adapting the userspace test in the mean time.

Do you think the patch needs to be further modified?

Best regards,

V.

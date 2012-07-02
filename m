From: Jonas Keidel <jonas@jonas-keidel.de>
Date: Mon, 02 Jul 2012 11:32:13 +0200
Subject: [Buildroot] Buildroot Udev Compiling
In-Reply-To: <20120701041022.GA25705@sapphire.tkos.co.il>
References: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
 <4FEEF971.2000802@mind.be> <006601cd56c2$0004c850$000e58f0$@jonas-keidel.de>
 <20120701041022.GA25705@sapphire.tkos.co.il>
Message-ID: <49efc9af561960c01d21e4e2047e9de0@jonas-keidel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Baruch,

> Busybox includes mdev which is a simplified udev. Note, however, that 
> mdev
> relies on the old hotplug mechanism to get device information from
> the kernel
> at run-time. This hostplug mechanism is inherently racy. For the
> initramfs use
> case this should be enough, though.

I know that it is implemented and I already tested that in my script. 
But I also want to try the udev variant because it is more flexible.
I've tested buildig today again and i got the same error as on the days 
before. Nothing changed. What can I do?

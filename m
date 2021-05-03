From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 May 2021 13:53:52 +0200
Subject: [Buildroot] [PATCH v2 4/6] boot/beaglev-ddrinit: new package
In-Reply-To: <CAEUhbmU0SRMbRt4Cb-i=WLCyNFsi+o-nKGkaxaJCxiFv4wVBjw@mail.gmail.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-5-thomas.petazzoni@bootlin.com>
 <CAEUhbmU0SRMbRt4Cb-i=WLCyNFsi+o-nKGkaxaJCxiFv4wVBjw@mail.gmail.com>
Message-ID: <20210503135352.354748ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 May 2021 19:30:13 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> nits: please put secondBoot first in this patch series

The only reason why beaglev-ddrinit appears before beaglev-secondboot
in this series is because beaglev-ddrinit sorts before
beaglev-secondboot by alphabetic ordering.

> I expect the ddrInit firmware is no longer necessary when upstream
> U-Boot supports SPL for this target. For the time being, this patch
> looks good.

Yes, indeed.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

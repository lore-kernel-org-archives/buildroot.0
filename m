From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:27:13 +0200
Subject: [Buildroot] [PATCH 0/2] weston: fix i.MX support
In-Reply-To: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
References: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
Message-ID: <20200912142713.6da9e0d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jun 2020 14:54:58 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Gary Bisson (2):
>   package/weston: add imx-gpu-viv as possible egl provider
>   package/weston-imx: remove deprecated package

Thanks, series applied.

For the first patch, I think we need to add a proper libgbm virtual
package. I had a patch series for that, but it's not trivial as not all
gbm implementations implement the full/recent GBM API. I had some ideas
to address that, but needs some more investigation/time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

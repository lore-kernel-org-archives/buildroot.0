From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Sep 2014 15:48:31 +0200
Subject: [Buildroot] [PATCH 2/2] freescale/imx6-sabresd: use up-to-date
 mainline Linux
In-Reply-To: <5422BB4B.7050703@freescale.com>
References: <1411560193-9697-1-git-send-email-luca@lucaceresoli.net>
 <1411560193-9697-3-git-send-email-luca@lucaceresoli.net>
 <5422BB4B.7050703@freescale.com>
Message-ID: <20140924154831.3fe131bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Wed, 24 Sep 2014 14:38:35 +0200, Vincent Stehl? wrote:

> I am not sure if abandoning the Freescale release kernel is the best
> option for i.MX6. Indeed, if you want e.g. proper video
> (package/freescale-imx/imx-vpu) and 3D
> (package/freescale-imx/gpu-viv-bin-mx6q) support to still work as
> expected you need to stay with the 3.10.17.
> 
> Wouldn't you prefer to align the headers instead?

Yes, I agree. For such platforms, it makes more sense to use the vendor
kernel version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

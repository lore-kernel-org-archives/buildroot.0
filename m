From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 09:25:48 +0100
Subject: [Buildroot] Prebuilt ARC tools are way too old
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681D2D2A@DE02WEMBXB.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE64681D2D2A@DE02WEMBXB.internal.synopsys.com>
Message-ID: <20190204092548.15b42a23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

On Mon, 4 Feb 2019 08:13:11 +0000
Alexey Brodkin <alexey.brodkin@synopsys.com> wrote:

> May I kindly ask you to create a newer prebuilt ARC toolchain
> which uses arc-2018.09 GNU tools?
> 
> arc-2018.09 is based on GCC 8.2 and has a bunch of fixes as compared to
> older tools.
> 
> As of today the latest prebuilt ARC tools are br-arcle-hs38-full-2018.11-rc1.tar.bz2
> and it's still based on arc-2018.03 (GCC 7.x based).
> 
> What's more in ARC config fragment even older tarball is mentioned 
> https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/br-arcle-hs38.config#n6
> 
> Probably there's not much sense in updating br-arcle-hs38.config with still obsolete
> tools and better wait before GCC 8.x based tools are available in prebuilt form.

Thanks for pinging me on this! I'll rebuild the toolchain with 2018.11
for now, and once 2019.02-rc1 is released, I'll rebuild again.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

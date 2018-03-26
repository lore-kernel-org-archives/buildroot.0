From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 21:54:10 +0200
Subject: [Buildroot] [PATCH v5 1/5] qemu-host: remove support for some
 powerpc processors.
In-Reply-To: <20180318190131.21404-2-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
 <20180318190131.21404-2-aduskett@gmail.com>
Message-ID: <20180326215410.6b598320@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Mar 2018 15:01:27 -0400, Adam Duskett wrote:
> The 620, 630, and 970 are not supported at this time by qemu.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v4:
>   - Add patch to series.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

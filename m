From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:11:24 +0100
Subject: [Buildroot] [PATCH 4/4] arch/arm: add an armv8.3a core
In-Reply-To: <c6db960a999901cb0beaac68b264e7c9b82e8891.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
 <c6db960a999901cb0beaac68b264e7c9b82e8891.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <20181230161124.622b233a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 15:16:13 +0100, Yann E. MORIN wrote:
> The armv8.3a generation is a cumulative extension to armv8.2a.
> 
> Since gcc correctly enables the appropriate extensions based on the core
> name, we don't really need to introduce a separate config for armv8.3a,
> and we can piggyback on armv8a.
> 
> This new core is AArch64 only.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in.arm | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

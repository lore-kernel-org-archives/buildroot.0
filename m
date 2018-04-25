From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:38:34 +0200
Subject: [Buildroot] [PATCH v3 3/6] squashfs: add host zstd support
In-Reply-To: <20180416193953.19924-3-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-3-ps.report@gmx.net>
Message-ID: <20180425233834.10c0267d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 21:39:50 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - no changes

I hate when we add unconditional dependencies to host packages, when
those dependencies are in fact optional. Long term, we really need to
find a better way of doing this.

In the mean time: applied, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

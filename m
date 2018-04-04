From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 23:00:11 +0200
Subject: [Buildroot] [PATCH v3 1/2] postgresql: add version output to
 pg_config
In-Reply-To: <20180312101231.2280-1-aduskett@gmail.com>
References: <20180312101231.2280-1-aduskett@gmail.com>
Message-ID: <20180404230011.268a27bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Mar 2018 06:12:30 -0400, Adam Duskett wrote:
> Some external packages call pg_config to determine the installed PostgreSQL
> version. Add this output to Buildroots own pg_config, so these packages
> correctly compile.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v3:
>  - Added this patch to the series.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

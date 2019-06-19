From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:49:35 +0200
Subject: [Buildroot] [PATCH 14/27] package/gpsd: use common
 BR2_TOOLCHAIN_HAS_GCC_BUG_68485
In-Reply-To: <20190614210346.121013-15-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-15-giulio.benetti@micronovasrl.com>
Message-ID: <20190619214935.1dd70c72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:33 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Workaround for Gcc ICE works ok, but it's issued if BR2_microblaze=y
> with a local comment. Let's use BR2_TOOLCHAIN_HAS_GCC_BUG_68485 instead
> to avoid repeating ICE bug comment for every package affected from it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/gpsd/gpsd.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

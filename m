From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:54:12 +0200
Subject: [Buildroot] [PATCH 16/27] package/libspatialindex: use common
 BR2_TOOLCHAIN_HAS_BUG_68485
In-Reply-To: <20190614210346.121013-17-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-17-giulio.benetti@micronovasrl.com>
Message-ID: <20190619215412.6a177ca4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:35 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> For consistency with the rest of packages let's use common
> BR2_TOOLCHAIN_HAS_BUG_68485 instead of !BR2_microblaze condition with
> comment on top of it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/libspatialindex/libspatialindex.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

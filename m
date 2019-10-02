From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:06:57 +0200
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20191002160327.3102-1-giulio.benetti@benettiengineering.com>
References: <20191002160327.3102-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191002210657.08ae74d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 18:03:27 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> For 5.3 support.
> 
> git shortlog --invert-grep --grep=travis --no-merges
> edd3cf4ae7ea5ec573a0eccfbbeb985244499a00..
> John-Eric Kamps (2):
>       Add allwinner A64 support
>       Fixed SoB
> 
> Maxime Ripard (1):
>       mali: Fix build for 5.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash  | 2 +-
>  .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

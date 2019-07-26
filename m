From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:04:25 +0200
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20190723081141.35064-1-giulio.benetti@micronovasrl.com>
References: <20190723081141.35064-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190726230425.61d537f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jul 2019 10:11:41 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> For 5.1 support.
> 
> git shortlog --invert-grep --grep=travis --no-merges
> c12e16553576b050e74a8ed404cb555ce4b8e573..
> Giulio Benetti (1):
>       README: update mali-blobs URL
> 
> Maxime Ripard (1):
>       Fix build with 5.1
> 
> Roman Stratiienko (2):
>       Add r9p0 version
>       Enable r9p0 build
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
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

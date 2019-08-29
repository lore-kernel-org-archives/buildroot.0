From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:58:14 +0200
Subject: [Buildroot] [PATCH] glmark2: Bump to the latest version
In-Reply-To: <20190828124011.21756-1-narmstrong@baylibre.com>
References: <20190828124011.21756-1-narmstrong@baylibre.com>
Message-ID: <20190829225814.6f80cd8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Aug 2019 14:40:11 +0200
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Bump to the latest git version, containing multiple fixes and support for
> render-only GPUs (lima, panfrost, ...) and missing DRM driver names to run
> like meson, rockchip, sun4i-drm.
> 
> Tested on Khadas VIM2 (aarch64) and Panfrost.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  package/glmark2/glmark2.hash | 2 +-
>  package/glmark2/glmark2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

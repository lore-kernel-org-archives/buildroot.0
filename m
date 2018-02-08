From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:08:15 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.0
In-Reply-To: <20180207155454.30401-1-brgl@bgdev.pl>
References: <20180207155454.30401-1-brgl@bgdev.pl>
Message-ID: <20180208230815.0c460164@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Feb 2018 16:54:54 +0100, Bartosz Golaszewski wrote:
> This is a major update for libgpiod. The API is not compatible with the
> v0.x.y series but since nothing in current buildroot git depends on
> this project, I believe we can simply bump the version.
> 
> The included tools are compatible with their 0.x.y counterparts.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

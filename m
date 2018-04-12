From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:19:18 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.0.1
In-Reply-To: <20180412152540.32447-1-brgl@bgdev.pl>
References: <20180412152540.32447-1-brgl@bgdev.pl>
Message-ID: <20180412211918.548d2a24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 17:25:40 +0200, Bartosz Golaszewski wrote:
> This is a bugfix release. It contains the following changes since v1.0:
> 
> - include Doxyfile in the release tarball
> - fix the implicit-fallthrough warnings
> - make tests work together with gpio-mockup post v4.16 linux kernel
> - use reference counting for line file descriptors to avoid calling
>   close() on the same descriptors multiple times
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

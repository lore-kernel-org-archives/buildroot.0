From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 15:38:35 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.4.1
In-Reply-To: <20190807114241.16456-1-brgl@bgdev.pl>
References: <20190807114241.16456-1-brgl@bgdev.pl>
Message-ID: <20190807153835.22249d2f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Aug 2019 13:42:41 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This is a bug-fix release addressing the following issues:
> 
> - fix GCC8 warnings when building python bindings
> - fix a bug in gpioinfo where lines used by the kernel without any
>   consumer string were reported as unused
> - fix a bug in line::event_get_fd() in C++ bindings where the exception
>   wouldn't be thrown in error cases due to a missing 'throw' keyword
> 
> It also fixed a couple problems with the test-suite but it doesn't
> affect the buildroot package.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

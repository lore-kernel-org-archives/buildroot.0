From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:06:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/sdl_image: fix WebP dynamically
 loaded on host build
In-Reply-To: <20200712195712.332139-1-paul@crapouillou.net>
References: <20200712195712.332139-1-paul@crapouillou.net>
Message-ID: <20200712230622.691aa9e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 21:57:11 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Just like with libjpeg and libpng, we don't want libwebp to be
> dynamically loaded by SDL_image at runtime.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/sdl_image/sdl_image.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

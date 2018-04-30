From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:41:17 +0200
Subject: [Buildroot] [PATCH 1/2] sdl2: bump version to 2.0.8
In-Reply-To: <20180430120459.8438-1-peter@korsgaard.com>
References: <20180430120459.8438-1-peter@korsgaard.com>
Message-ID: <20180430174117.439e1c59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 14:04:58 +0200, Peter Korsgaard wrote:
> Drop now upstreamed patch.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../sdl2/0001-make-cross-compiler-friendly.patch   | 167 ---------------------
>  package/sdl2/sdl2.hash                             |   4 +-
>  package/sdl2/sdl2.mk                               |   2 +-
>  3 files changed, 3 insertions(+), 170 deletions(-)
>  delete mode 100644 package/sdl2/0001-make-cross-compiler-friendly.patch

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

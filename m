From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:11:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to
 1.0.5
In-Reply-To: <20190707121232.4333-1-bernd.kuhls@t-online.de>
References: <20190707121232.4333-1-bernd.kuhls@t-online.de>
Message-ID: <20190714161121.5e682fc0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jul 2019 14:12:32 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added license hash, switched _SITE to github.
> 
> Removed --with-glib=no, glib support was removed upstream:
> https://github.com/fribidi/fribidi/commit/03ba9fc5358bb3dd78c4e8708abefaad106475d0
> 
> Autoreconf is not needed anymore after upstream fixed
> https://github.com/fribidi/fribidi/issues/35
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Please note that this patch does not switch to meson compared to
> http://patchwork.ozlabs.org/patch/1111286/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

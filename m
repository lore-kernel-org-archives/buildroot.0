From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:35:02 +0200
Subject: [Buildroot] [PATCH 1/3] package/at-spi2-core: bump to version
 2.36.0
In-Reply-To: <20200503090111.331775-1-fontaine.fabrice@gmail.com>
References: <20200503090111.331775-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509233502.69a7c550@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 May 2020 11:01:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Add upstream link on sha256
> - License is LGPL-2.1+ since
>   https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/1256988c433cf8b9e0780c13d66374cb057f7329
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Fix-meson.build-for-meson-0.50.0.patch | 35 -------------------
>  package/at-spi2-core/at-spi2-core.hash        |  6 ++--
>  package/at-spi2-core/at-spi2-core.mk          |  4 +--
>  3 files changed, 6 insertions(+), 39 deletions(-)
>  delete mode 100644 package/at-spi2-core/0001-Fix-meson.build-for-meson-0.50.0.patch

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

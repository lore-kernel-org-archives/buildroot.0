From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.3.2
In-Reply-To: <20190622114640.20995-1-fontaine.fabrice@gmail.com>
References: <20190622114640.20995-1-fontaine.fabrice@gmail.com>
Message-ID: <20190622174954.5ebad3a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 13:46:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...xiv2-header-that-include-all-headers.patch | 29 ------------
>  ...m-taglib-config-when-cross-compiling.patch | 46 -------------------
>  package/gerbera/gerbera.hash                  |  2 +-
>  package/gerbera/gerbera.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 77 deletions(-)
>  delete mode 100644 package/gerbera/0001-Use-exiv2-header-that-include-all-headers.patch
>  delete mode 100644 package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

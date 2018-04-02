From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:34:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/libressl: bump version to 2.7.2
In-Reply-To: <20180402083708.21199-1-bernd.kuhls@t-online.de>
References: <20180402083708.21199-1-bernd.kuhls@t-online.de>
Message-ID: <20180402113422.439d2839@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 10:37:07 +0200, Bernd Kuhls wrote:
> Removed patch 0001, a different version was applied upstream, please
> see upstream PR 82 for details. Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ix-build-with-musl-and-older-Linux-kernel.patch | 38 ----------------------
>  package/libressl/libressl.hash                     |  4 ++-
>  package/libressl/libressl.mk                       |  2 +-
>  3 files changed, 4 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libressl/0002-Fix-build-with-musl-and-older-Linux-kernel.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

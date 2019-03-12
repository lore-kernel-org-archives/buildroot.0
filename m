From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:37:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version
 2.0.2
In-Reply-To: <20190309223833.12252-1-fontaine.fabrice@gmail.com>
References: <20190309223833.12252-1-fontaine.fabrice@gmail.com>
Message-ID: <20190312223746.02f0bc0a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 23:38:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove two patches (already in version)
> - Update hash of LICENSE.md, clarifications on BSD and zlib were added:
>   https://github.com/libjpeg-turbo/libjpeg-turbo/commit/90e2d7f3fdbfbc00afc2d21c4a5b61eebcd3c849
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Fix-int-overflow-segfault-w-big-BMP.patch | 51 -------------------
>  ...on-t-allow-quantization-w-non-RGB-CS.patch | 39 --------------
>  package/jpeg-turbo/jpeg-turbo.hash            | 10 ++--
>  package/jpeg-turbo/jpeg-turbo.mk              |  2 +-
>  4 files changed, 6 insertions(+), 96 deletions(-)
>  delete mode 100644 package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch
>  delete mode 100644 package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

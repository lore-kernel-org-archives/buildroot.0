From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 00:41:27 +0100
Subject: [Buildroot] [PATCH] package/libiio: bump to version 0.19
In-Reply-To: <1582059128-12704-1-git-send-email-pjtexier@koncepto.io>
References: <1582059128-12704-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200219004127.33deee5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 21:52:08 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> See full changelog https://github.com/analogdevicesinc/libiio/releases/tag/v0.19
> 
> Also remove patch applied upstream
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  ...ll-of-binaries-with-a-static-only-library.patch | 44 ----------------------
>  package/libiio/libiio.hash                         |  2 +-
>  package/libiio/libiio.mk                           |  2 +-
>  3 files changed, 2 insertions(+), 46 deletions(-)
>  delete mode 100644 package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

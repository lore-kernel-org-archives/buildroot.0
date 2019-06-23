From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:20:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiio: bump to version 0.18
In-Reply-To: <1561295439-11676-1-git-send-email-pjtexier@koncepto.io>
References: <1561295439-11676-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190623172000.62878304@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 15:10:39 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> See https://github.com/analogdevicesinc/libiio/releases
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  ...ll-of-binaries-with-a-static-only-library.patch | 44 ++++++++++++++++++++++
>  package/libiio/libiio.hash                         |  2 +-
>  package/libiio/libiio.mk                           |  2 +-
>  3 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644 package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:29:20 +0200
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.7.3.3
In-Reply-To: <eb57684d2cf6028ed439fa6b55ae3c0ad1c94d1d.1565935582.git.baruch@tkos.co.il>
References: <eb57684d2cf6028ed439fa6b55ae3c0ad1c94d1d.1565935582.git.baruch@tkos.co.il>
Message-ID: <20190817152920.312870e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 09:06:22 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop if_tun.h kernel header removal patch; current musl doesn't need it.
> 
> Don't disable termios_ispeed; commit 1c25119a9360 ("socat: convert to
> AUTOTARGETS") disabled it for no apparent reason.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...io-tun-remove-if_tun.h-kernel-header.patch | 91 -------------------
>  package/socat/socat.hash                      |  6 +-
>  package/socat/socat.mk                        |  4 +-
>  3 files changed, 4 insertions(+), 97 deletions(-)
>  delete mode 100644 package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

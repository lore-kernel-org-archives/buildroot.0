From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:26:21 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/shellinabox: bump version
 to 2.20
In-Reply-To: <20180819194457.12196-1-bernd.kuhls@t-online.de>
References: <20180819194457.12196-1-bernd.kuhls@t-online.de>
Message-ID: <20180819232621.2ffba2fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 21:44:57 +0200, Bernd Kuhls wrote:
> Removed patch 0002, applied upstream, which also added --disable-utmp
> for musl:
> https://github.com/shellinabox/shellinabox/commit/05b2d3630c48dc9bca678d8158fce486c583c26b
> 
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...launcher.c-include-sys-ttydefaults.h.patch | 27 -------------------
>  package/shellinabox/shellinabox.hash          |  6 +++--
>  package/shellinabox/shellinabox.mk            |  4 +--
>  3 files changed, 6 insertions(+), 31 deletions(-)
>  delete mode 100644 package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 16:07:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
In-Reply-To: <20180728082445.25019-1-bernd.kuhls@t-online.de>
References: <20180728082445.25019-1-bernd.kuhls@t-online.de>
Message-ID: <20180728160703.26ced9dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jul 2018 10:24:45 +0200, Bernd Kuhls wrote:
> Removed patch 0002 after upstream commit:
> https://github.com/tvheadend/tvheadend/commit/e26ce3390a5ca88f3fcee8a7fa0e4bb1b078e538
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-configure-check-for-strlcat-strlcpy.patch | 97 -------------------
>  package/tvheadend/tvheadend.hash              |  2 +-
>  package/tvheadend/tvheadend.mk                |  2 +-
>  3 files changed, 2 insertions(+), 99 deletions(-)
>  delete mode 100644 package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

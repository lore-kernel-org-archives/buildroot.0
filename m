From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:05:52 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: remove debugging
 patch
In-Reply-To: <1438014835-11707-1-git-send-email-christian@paral.in>
References: <1438014835-11707-1-git-send-email-christian@paral.in>
Message-ID: <20150727230552.3f49983e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Mon, 27 Jul 2015 09:33:55 -0700, Christian Stewart wrote:
> This patch updates rtl8821au to include an upstream commit which
> disables debug output without a runtime insmod parameter debug=level.
> This makes the old buildroot patch to remove hardcoded debug defines
> unnecessary: as such, it has been removed.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821au/0001-disable-default-debug.patch | 24 ----------------------
>  package/rtl8821au/rtl8821au.mk                     |  2 +-
>  2 files changed, 1 insertion(+), 25 deletions(-)
>  delete mode 100644 package/rtl8821au/0001-disable-default-debug.patch

I've applied after tweaking the commit log as suggested by Yann, and
also changed the commit title to:

	package/rtl8821au: bump version and remove debugging patch

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

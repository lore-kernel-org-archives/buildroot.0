From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:11:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.8.3
In-Reply-To: <20180630112907.20702-1-bernd.kuhls@t-online.de>
References: <20180630112907.20702-1-bernd.kuhls@t-online.de>
Message-ID: <20180630181146.00c33df0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 13:29:07 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream.
> 
> Release notes: https://www.samba.org/samba/history/samba-4.8.3.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0004-libgpo-fix-build-without-ads.patch   | 49 -------------------
>  package/samba4/samba4.hash                    |  4 +-
>  package/samba4/samba4.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 52 deletions(-)
>  delete mode 100644 package/samba4/0004-libgpo-fix-build-without-ads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:13:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump to 1.7.1
In-Reply-To: <20180721120349.21308-1-bernd.kuhls@t-online.de>
References: <20180721120349.21308-1-bernd.kuhls@t-online.de>
Message-ID: <20180725231358.2e6d62f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jul 2018 14:03:49 +0200, Bernd Kuhls wrote:
> Fixes CVE-2018-14055 & CVE-2018-14056.
> 
> Changelog: https://wiki.znc.in/ChangeLog/1.7.1
> 
> Removed 0001-Fix-build-without-SSL-support.patch, applied upstream:
> https://github.com/znc/znc/commit/e567f4cb73a1637141f7e4fc3b0ef44e79568048
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Fix-build-without-SSL-support.patch  | 37 -------------------
>  package/znc/znc.hash                          |  2 +-
>  package/znc/znc.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/znc/0001-Fix-build-without-SSL-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

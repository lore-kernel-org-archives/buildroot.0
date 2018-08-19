From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:28:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/squid: bump version to 4.2
In-Reply-To: <20180819205020.12303-1-bernd.kuhls@t-online.de>
References: <20180819205020.12303-1-bernd.kuhls@t-online.de>
Message-ID: <20180819232823.0b00b21e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 22:50:20 +0200, Bernd Kuhls wrote:
> Added dependency for libxml2:
> http://www.squid-cache.org/Versions/v4/RELEASENOTES.html#ss2.9
> 
> Rebased patch 0001, removed patches 0002 & 0003 after being applied
> upstream. Added sha256 hash for tarball.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-assume-get-certificate-ok.patch      | 18 ++++++----
>  ...e-endofName-never-exceeds-tagEnd-130.patch | 35 -------------------
>  ...logging-for-transactions-without-a-c.patch | 31 ----------------
>  package/squid/Config.in                       |  1 +
>  package/squid/squid.hash                      |  9 ++---
>  package/squid/squid.mk                        |  8 ++---
>  6 files changed, 21 insertions(+), 81 deletions(-)
>  delete mode 100644 package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
>  delete mode 100644 package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

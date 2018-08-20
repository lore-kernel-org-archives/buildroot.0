From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 14:35:02 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/netsnmp: bump version to
 5.8
In-Reply-To: <20180819065146.19958-1-bernd.kuhls@t-online.de>
References: <20180819065146.19958-1-bernd.kuhls@t-online.de>
Message-ID: <20180820143502.47d92ad4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 08:51:46 +0200, Bernd Kuhls wrote:
> Removed patch, applied upstream, autoreconf is not needed anymore.
> Added sha256 hashes for tarball and license file.
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ate-the-hard-coded-libnl-3-include-p.patch | 300 ------------------
>  package/netsnmp/netsnmp.hash                  |   9 +-
>  package/netsnmp/netsnmp.mk                    |   5 +-
>  3 files changed, 8 insertions(+), 306 deletions(-)
>  delete mode 100644 package/netsnmp/0001-configure-Eliminate-the-hard-coded-libnl-3-include-p.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:21:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security
 bump to version 1.6.6
In-Reply-To: <20180821205325.3551-1-bernd.kuhls@t-online.de>
References: <20180821205325.3551-1-bernd.kuhls@t-online.de>
Message-ID: <20180821232100.27e52ad7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 22:53:25 +0200, Bernd Kuhls wrote:
> Fixes CVE-2018-14599, CVE-2018-14600 & CVE-2018-14598:
> https://lists.x.org/archives/xorg-announce/2018-August/002915.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libX11/xlib_libX11.hash | 9 +++++++--
>  package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
>  2 files changed, 8 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

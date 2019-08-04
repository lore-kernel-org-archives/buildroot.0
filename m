From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:52:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpsd: bump version to 3.19
In-Reply-To: <20190804134431.21541-1-bernd.kuhls@t-online.de>
References: <20190804134431.21541-1-bernd.kuhls@t-online.de>
Message-ID: <20190804185246.0a8c72f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 15:44:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches applied upstream:
> https://gitlab.com/gpsd/gpsd/commit/02d21faebec245e1526449fb54e7078914d75db7
> https://gitlab.com/gpsd/gpsd/commit/d685ab05952d7eadf012fc054032f0190cf2abda
> https://gitlab.com/gpsd/gpsd/commit/bfc7d136fb78fd20875efceb949c2e537e5435ee
> 
> Project moved to gitlab, updated project URL.
> 
> Updated license hash and changed license to BSD-2-Clause after upstream
> commit:
> https://gitlab.com/gpsd/gpsd/commit/2a286af6cf4f7fd469bf6bea644a7416c9631cde
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...h-when-not-building-python-man-pages.patch | 59 -------------------
>  ...-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch | 38 ------------
>  ...tates.h-fix-isync-build-without-NMEA.patch | 37 ------------
>  package/gpsd/Config.in                        |  2 +-
>  package/gpsd/gpsd.hash                        |  4 +-
>  package/gpsd/gpsd.mk                          |  4 +-
>  6 files changed, 5 insertions(+), 139 deletions(-)
>  delete mode 100644 package/gpsd/0002-SConstruct-Do-not-crash-when-not-building-python-man-pages.patch
>  delete mode 100644 package/gpsd/0003-driver_ubx-Save-UBX-RXM-RAWX-data-in-rawdate_t.patch
>  delete mode 100644 package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

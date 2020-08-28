From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:13:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security
 bump version to 1.6.12
In-Reply-To: <20200828062309.911291-1-bernd.kuhls@t-online.de>
References: <20200828062309.911291-1-bernd.kuhls@t-online.de>
Message-ID: <20200828091353.1b4173d1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2020 08:23:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2020-14363:
> https://lists.x.org/archives/xorg-announce/2020-August/003056.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
>  package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

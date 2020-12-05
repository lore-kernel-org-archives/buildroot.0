From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:41:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.10
In-Reply-To: <20201203182026.2290039-1-bernd.kuhls@t-online.de>
References: <20201203182026.2290039-1-bernd.kuhls@t-online.de>
Message-ID: <20201205214121.49f4a96f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 19:20:26 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2020-December/003067.html
> 
> Remove patches which were applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...Info-and-SetDeviceIndicators-heap-ov.patch | 100 -------------
>  ...heck-SetMap-request-length-carefully.patch | 131 ------------------
>  .../xserver_xorg-server.hash                  |   6 +-
>  .../xserver_xorg-server.mk                    |   2 +-
>  4 files changed, 4 insertions(+), 235 deletions(-)
>  delete mode 100644 package/x11r7/xserver_xorg-server/0007-Fix-XkbSetDeviceInfo-and-SetDeviceIndicators-heap-ov.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/0008-Check-SetMap-request-length-carefully.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

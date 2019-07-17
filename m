From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 10:21:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: bump version to
 2.5.0
In-Reply-To: <20190714152126.20646-1-bernd.kuhls@t-online.de>
References: <20190714152126.20646-1-bernd.kuhls@t-online.de>
Message-ID: <20190717102115.19cc0a34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 17:21:26 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch 0001, applied upstream:
> https://github.com/intel/libva-utils/commit/d71e2604972d35e3803d9b66c7d2ed0a80c145dc
> 
> Removed patch 0002 after upstream fixed non-X11 build of sfcsample:
> https://github.com/intel/libva-utils/commit/7be46f017caee2a23097bc8371f2fe4eb1b677a0
> 
> By removing all patches autoreconf is not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva-utils/0001-check-ssp.patch      | 145 ------------------
>  ...failure-when-x11-support-is-disabled.patch |  33 ----
>  package/libva-utils/libva-utils.hash          |   6 +-
>  package/libva-utils/libva-utils.mk            |   5 +-
>  4 files changed, 4 insertions(+), 185 deletions(-)
>  delete mode 100644 package/libva-utils/0001-check-ssp.patch
>  delete mode 100644 package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:55:47 +0200
Subject: [Buildroot] [PATCH 1/1] configs/chromebook_elm: bump to Linux
 v5.10
In-Reply-To: <20210623123904.1341170-1-bilal.wasim@imgtec.com>
References: <20210623123904.1341170-1-bilal.wasim@imgtec.com>
Message-ID: <20210703225547.7447541a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2021 13:39:04 +0100
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> Update the chromebook elm configuration to use v5.10 which is an LTS.
> 
> With v5.10, none of the patches previously needed to enable the display
> are needed anymore. Deleting them and making minor updates to the linux
> kernel configuration.
> 
> Signed-off-by: Bilal Wasim <bilal.wasim@imgtec.com>
> ---
>  board/chromebook/elm/linux.config             |  66 ++++---
>  ...ctor-Set-default-status-connected-fo.patch |  35 ----
>  ...ps8640-Get-the-EDID-from-eDP-control.patch |  50 ------
>  ...0-Return-an-error-for-incorrect-atta.patch |  35 ----
>  ...0-Print-an-error-if-VDO-control-fail.patch |  58 -------
>  ...e-ps8640-Rework-power-state-handling.patch | 162 ------------------
>  ...tek-dsi-Fix-scrolling-of-panel-with-.patch |  41 -----
>  configs/chromebook_elm_defconfig              |   9 +-
>  8 files changed, 48 insertions(+), 408 deletions(-)
>  delete mode 100644 board/chromebook/elm/patches/linux/0001-drm-bridge_connector-Set-default-status-connected-fo.patch
>  delete mode 100644 board/chromebook/elm/patches/linux/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch
>  delete mode 100644 board/chromebook/elm/patches/linux/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch
>  delete mode 100644 board/chromebook/elm/patches/linux/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch
>  delete mode 100644 board/chromebook/elm/patches/linux/0005-drm-bridge-ps8640-Rework-power-state-handling.patch
>  delete mode 100644 board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

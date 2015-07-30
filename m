From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:27:58 +0200
Subject: [Buildroot] [PATCH 13/47] package/kodi-platform: new package
In-Reply-To: <1437597069-6448-14-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-14-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152758.35833dde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:35 +0200, Bernd Kuhls wrote:
> This package is used by the PVR addon packages and has no use by itself,
> therefore is does not show up in menuconfig.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-platform/Config.in        |    7 +++++++
>  package/kodi-platform/kodi-platform.mk |   17 +++++++++++++++++
>  package/kodi/Config.in                 |    2 ++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/kodi-platform/Config.in
>  create mode 100644 package/kodi-platform/kodi-platform.mk

Applied with some changes:

    [Thomas:
     - fix license information, as noticed by Yann E. Morin: the license
       is GPLv2+, not GPLv3+, and there is no COPYING file, so a short
       source file with the license header was used instead.
     - remove -DCMAKE_MODULE_PATH, no longer needed now that
       kodi-config.cmake is fixed.
     - add patch to fix kodi-platform-config.cmake for cross-compilation.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

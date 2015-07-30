From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:30:18 +0200
Subject: [Buildroot] [PATCH 47/47]
 package/kodi-visualisation-waveforhue: new package
In-Reply-To: <1437597069-6448-48-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-48-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730153018.0790acfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:31:09 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-visualisation-waveforhue/Config.in       |    6 ++++++
>  .../kodi-visualisation-waveforhue.mk                  |   17 +++++++++++++++++
>  package/kodi/Config.in                                |    1 +
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/kodi-visualisation-waveforhue/Config.in
>  create mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk

This package was not building in OpenGL ES / EGL mode due to an invalid
header path in src/Main_gles.cpp. I've fixed that by the patch
0001-Adapt-xbmc_vis_dll.h-header-path.patch. If you could submit it
upstream, it would be great.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

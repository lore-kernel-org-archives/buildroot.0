From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:29:11 +0200
Subject: [Buildroot] [PATCH 37/47] package/kodi-screensaver-asteroids:
 new package
In-Reply-To: <1437597069-6448-38-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-38-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152911.402c72db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:59 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-screensaver-asteroids/Config.in          |    6 ++++++
>  .../kodi-screensaver-asteroids.mk                     |   17 +++++++++++++++++
>  package/kodi/Config.in                                |    4 ++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/kodi-screensaver-asteroids/Config.in
>  create mode 100644 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk

For me, none of the screensaver packages worked with OpenGL ES, since
they all include <GL/gl.h>. You have added a dependency on GL for the
kodi-screensaver-crystalmorph package, but all other screensaver needed
the same dependency, so I added it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

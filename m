From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:48:34 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/libsoil: new package
In-Reply-To: <1446891857-1755-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446891857-1755-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219144834.357139e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Nov 2015 11:24:17 +0100, Bernd Kuhls wrote:
> Needed for these new Kodi addons:
> 
> kodi-screensaver-asterwave
> kodi-screensaver-cpblobs
> kodi-screensaver-matrixtrails
> kodi-screensaver-planestate
> kodi-visualisation-fountain
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: added various changes after a review by Thomas
>     - moved "-c -fPIC" from _CFLAGS to the patched Makefile
>     - moved extracted source code from the "Simple OpenGL Image Library"
>       subdir into $(@D)
>     - LIBSOIL_MAKEFILE now contains the filename of the Makefile

Applied with some minor changes:

    [Thomas:
     - don't pass LIBSOIL_CFLAGS since this variable no longer exists.
     - pass TARGET_CONFIGURE_OPTS on the right hand side of make for the
       install steps, like was done for the build step.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jan 2013 17:57:40 +0100
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <50E43558.2000003@petroprogram.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com>
Message-ID: <20130102175740.359fc5ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Wed, 02 Jan 2013 15:25:44 +0200, Stefan Fr?berg wrote:

> What xorg version are this for ?
> Xorg 1.13.1 ?

1.13.1 is a X.org server version, so it is not directly relevant here.
I'm looking at X11R7.7, which is the latest stable release of X.org.
See http://www.x.org/releases/X11R7.7/src/everything/ for the complete
contents of this release.

From http://www.x.org/releases/X11R7.7/doc/xorg-docs/ReleaseNotes.txt:

Removed in this Release

             This release no longer contains the following drivers, due to lack
             of maintainers with relevant hardware. Existing driver versions
             may work with current Xorg servers, but they are not being
             actively updated to support Xorg driver API & ABI changes.

               ? xf86-input-acecad: Acecad Flair

               ? xf86-input-aiptek: Aiptek USB tablet

               ? xf86-video-apm: Alliance Pro Motion

               ? xf86-video-chips: Chips & Technologies

               ? xf86-video-i740: Intel i740

               ? xf86-video-rendition: Rendition Verite

Unmaintained   ? xf86-video-s3: S3 (not ViRGE or Savage)
drivers
               ? xf86-video-s3virge: S3 ViRGE

               ? xf86-video-sisusb: SiS Net2280-based USB

               ? xf86-video-suncg14: Sun CG14

               ? xf86-video-suncg3: Sun CG3

               ? xf86-video-sunleo: Sun Leo (ZX)

               ? xf86-video-suntcx: Sun TCX

               ? xf86-video-tseng: Tseng Labs

               ? xf86-video-xgi: XGI

               ? xf86-video-xgixp: XGI Volari 8300

Of course, I am curious to know if anybody is actually using one of
these drivers, in which case we can postpone the removal.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

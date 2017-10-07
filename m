From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 22:30:16 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: rename
 patch directory after the last version bump
In-Reply-To: <20171007130156.17309-1-romain.naour@gmail.com>
References: <20171007130156.17309-1-romain.naour@gmail.com>
Message-ID: <20171007223016.721d7c38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Oct 2017 15:01:56 +0200, Romain Naour wrote:
> The last bump [1] forgot to rename the patch directory and remove
> upstream patches.
> 
> We still need to fix the monotonic clock check which doesn't work
> when cross-compiling.
> 
> [1] 436659c55f8d3c6155546cfc666a13c793d992f9
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...target-buffer-in-SProcXSendExtensionEvent.patch | 39 ------------
>  ...isallow-GenericEvent-in-SendEvent-request.patch | 71 ----------------------
>  ...ify-all-events-in-ProcXSendExtensionEvent.patch | 50 ---------------
>  .../0007-Xi-Do-not-try-to-swap-GenericEvent.patch  | 45 --------------
>  .../0001-modesettings-needs-dri2.patch             |  0
>  ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch    |  0
>  7 files changed, 205 deletions(-)
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.19.3/0004-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.19.3/0005-dix-Disallow-GenericEvent-in-SendEvent-request.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.19.3/0006-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.19.3/0007-Xi-Do-not-try-to-swap-GenericEvent.patch
>  rename package/x11r7/xserver_xorg-server/{1.19.3 => 1.19.4}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.19.3 => 1.19.4}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.19.3 => 1.19.4}/0003-Remove-check-for-useSIGIO-option.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:40:04 +0100
Subject: [Buildroot] [PATCH/next 02/31] package/kodi-screensaver-rsxs:
 new package
In-Reply-To: <1456006176-21308-3-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229234004.5c433a70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:07 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                                   |  7 ++++
>  .../kodi-screensaver-rsxs/0001-cross-compile.patch | 37 ++++++++++++++++++++++
>  package/kodi-screensaver-rsxs/Config.in            | 10 ++++++
>  .../kodi-screensaver-rsxs.hash                     |  2 ++
>  .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 14 ++++++++
>  package/kodi/Config.in                             | 12 +------
>  package/kodi/kodi.mk                               | 20 ++----------
>  7 files changed, 73 insertions(+), 29 deletions(-)
>  create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
>  create mode 100644 package/kodi-screensaver-rsxs/Config.in
>  create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
>  create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk

Applied to next, thanks. Same comment as the previous patch: try to make
progress with upstreaming the patch, and the Config.in comment was not
properly using the package name.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

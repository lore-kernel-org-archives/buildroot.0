From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:47:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: bump to version 2.4.13
In-Reply-To: <1466961520-13428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466961520-13428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160626214719.5e0e641a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 19:18:40 +0200, Bernd Kuhls wrote:
> Removed 0001-ffmpeg30.patch after being applied upstream.
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../{0002-atomic.patch => 0001-atomic.patch}       |   0
>  package/opencv/0001-ffmpeg30.patch                 | 638 ---------------------
>  ...id-sysctl_h.patch => 0002-avoid-sysctl_h.patch} |   0
>  package/opencv/opencv.hash                         |   2 +-
>  package/opencv/opencv.mk                           |   2 +-
>  5 files changed, 2 insertions(+), 640 deletions(-)
>  rename package/opencv/{0002-atomic.patch => 0001-atomic.patch} (100%)
>  delete mode 100644 package/opencv/0001-ffmpeg30.patch
>  rename package/opencv/{0003-avoid-sysctl_h.patch => 0002-avoid-sysctl_h.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

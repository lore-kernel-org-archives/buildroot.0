From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:38:33 +0200
Subject: [Buildroot] [PATCH 1/6]
 package/x11r7/xdriver_xf86-video-mach64: disable DRI support when not
 available
In-Reply-To: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160413223833.4ca4bd90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 19:14:57 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-mach64/Config.in                    | 5 -----
>  package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk | 4 ++++
>  2 files changed, 4 insertions(+), 5 deletions(-)

All 6 patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

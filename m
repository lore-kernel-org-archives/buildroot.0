From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:29:30 +0100
Subject: [Buildroot] [PATCH 1/6] xdriver_xf86-video-glide: remove broken
 package
In-Reply-To: <20170307235054.25149-1-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
Message-ID: <20170309222930.62bc3492@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Mar 2017 00:50:49 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This package has been marked as broken since 2010. No need for legacy
> handling.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/x11r7/Config.in                                    |  1 -
>  package/x11r7/xdriver_xf86-video-glide/Config.in           | 10 ----------
>  .../xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash |  2 --
>  .../xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk   | 14 --------------
>  4 files changed, 27 deletions(-)
>  delete mode 100644 package/x11r7/xdriver_xf86-video-glide/Config.in
>  delete mode 100644 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash
>  delete mode 100644 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk

All applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

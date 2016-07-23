From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:42:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/libdrm: bump version to 2.4.69
In-Reply-To: <1469128040-4558-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469128040-4558-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160723144210.27a3377d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jul 2016 21:07:19 +0200, Bernd Kuhls wrote:
> Removed patch 0002, applied upstream:
> https://cgit.freedesktop.org/mesa/drm/commit/xf86drm.c?id=4031dc17bb728850c9b079c8d5f9cc0a379b9d46
> 
> Renumbered patch 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...mic-require-CAS-support-in-libatomic_ops.patch} |  0
>  ...nclude-limits.h-to-fix-build-error-on-Sol.patch | 31 ----------------------
>  package/libdrm/libdrm.hash                         |  4 +--
>  package/libdrm/libdrm.mk                           |  2 +-
>  4 files changed, 3 insertions(+), 34 deletions(-)
>  rename package/libdrm/{0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch => 0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch} (100%)
>  delete mode 100644 package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:13:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: Fix musl build error
 due to missing include of limits.h
In-Reply-To: <1443374728-27323-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443374728-27323-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150928221338.2a6ce9b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 27 Sep 2015 19:25:28 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/abb/abb935e7fe71369c593ae92b3acf4a2a674a0300/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...nclude-limits.h-to-fix-build-error-on-Sol.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

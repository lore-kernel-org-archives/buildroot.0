From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 16:46:36 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
In-Reply-To: <1398203237-11976-1-git-send-email-ps.report@gmx.net>
References: <1398203237-11976-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140425164636.25fe2f3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 22 Apr 2014 23:47:17 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/evemu/evemu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
> index 38b792d..df9aea1 100644
> --- a/package/evemu/evemu.mk
> +++ b/package/evemu/evemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EVEMU_VERSION = 1.0.10
> +EVEMU_VERSION = 1.2.0
>  EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
>  EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
>  EVEMU_LICENSE_FILES = COPYING COPYING.GPL3

This is causing some build failures in the autobuilders:

  http://autobuild.buildroot.org/results/24b/24b0e8214e528f455b630c47f93b50a83f308ab5/build-end.log

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

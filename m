From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:03:08 +0200
Subject: [Buildroot] [PATCH 1/2] qt/qt5script: Remove the GPLv2 licence
 file
In-Reply-To: <1437554012-25241-1-git-send-email-corjon.j@ecagroup.com>
References: <1437554012-25241-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150722110308.105925d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Wed, 22 Jul 2015 10:33:31 +0200, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5script/qt5script.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
> index 7f0efbb..c654fe5 100644
> --- a/package/qt5/qt5script/qt5script.mk
> +++ b/package/qt5/qt5script/qt5script.mk
> @@ -12,7 +12,7 @@ QT5SCRIPT_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>  QT5SCRIPT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2

Is the "or GPLv2" still valid, despite the GPLv2 file not being there?

> -QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
> +QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
>  else
>  QT5SCRIPT_LICENSE = Commercial license
>  QT5SCRIPT_REDISTRIBUTE = NO

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

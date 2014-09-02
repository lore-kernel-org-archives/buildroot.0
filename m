From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Sep 2014 17:12:59 +0200
Subject: [Buildroot] [PATCH 1/1] procps-ng: add INSTALL_STAGING=YES
In-Reply-To: <1409669853-21440-1-git-send-email-kaszak@gmail.com>
References: <1409669853-21440-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140902151259.GD4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-09-02 16:57 +0200, Karoly Kasza spake thusly:
> Procps-ng libraries needed in the staging directory by
> the new package openvmtools.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/procps-ng/procps-ng.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 8f9caf3..c327b4f 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -9,6 +9,7 @@ PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
>  PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
>  PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
>  PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
> +PROCPS_NG_INSTALL_STAGING = YES
>  
>  PROCPS_NG_DEPENDENCIES = ncurses
>  
> -- 
> 1.7.10.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

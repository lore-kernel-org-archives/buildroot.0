From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 22:44:59 +0100
Subject: [Buildroot] [PATCH v3] xinetd: change download location
In-Reply-To: <1414875280-57041-1-git-send-email-kaszak@gmail.com>
References: <1414875280-57041-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141101214459.GJ10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-11-01 21:54 +0100, Karoly Kasza spake thusly:
> xinetd.org is down, change to github instead.
> Hash can not be used, the tarball is generated.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Changes v2 -> v3:
>   - use github helper
> 
>  package/xinetd/xinetd.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> index 1fb91b5..92d0d53 100644
> --- a/package/xinetd/xinetd.mk
> +++ b/package/xinetd/xinetd.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -XINETD_VERSION = 2.3.15
> -XINETD_SITE = http://www.xinetd.org
> +XINETD_VERSION = xinetd-2-3-15
> +XINETD_SITE = $(call github,xinetd-org,xinetd,$(XINETD_VERSION))
>  XINETD_LICENSE = xinetd license
>  XINETD_LICENSE_FILES = COPYRIGHT
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

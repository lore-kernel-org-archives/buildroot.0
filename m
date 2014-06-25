From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 22:08:31 +0200
Subject: [Buildroot] [PATCH 20/54] lsuio: add license information
In-Reply-To: <1403636160-11807-20-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-20-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625200831.GH3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/lsuio/lsuio.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
> index 4e4f592..5f8a965 100644
> --- a/package/lsuio/lsuio.mk
> +++ b/package/lsuio/lsuio.mk
> @@ -6,5 +6,7 @@
>  
>  LSUIO_VERSION = 0.2.0
>  LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
> +LSUIO_LICENSE = GPLv2
> +LSUIO_LICENSE_FILES = COPYING
>  
>  $(eval $(autotools-package))
> -- 
> 1.8.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:05:41 +0100
Subject: [Buildroot] [PATCH 1/1] python-xlib: fix check-package warning
In-Reply-To: <20180114211657.5160-1-joseph.kogut@gmail.com>
References: <20180113221034.GH3226@scaer>
 <20180114211657.5160-1-joseph.kogut@gmail.com>
Message-ID: <20180114220541.GA16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2018-01-14 13:16 -0800, Joseph Kogut spake thusly:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/python-xlib/python-xlib.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
> index 93de424a3e..0ce6e43422 100644
> --- a/package/python-xlib/python-xlib.mk
> +++ b/package/python-xlib/python-xlib.mk
> @@ -1,8 +1,8 @@
> -###############################################################################
> +################################################################################
>  #
>  # python-xlib
>  #
> -###############################################################################
> +################################################################################
>  
>  PYTHON_XLIB_VERSION = 0.21
>  PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
> -- 
> 2.15.1
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

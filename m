From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 22:22:43 +0200
Subject: [Buildroot] [PATCH 1/3] imagemagick: bump to version 7.0.2-0
In-Reply-To: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160616202243.GI3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-06-15 09:34 -0300, Gustavo Zacarias spake thusly:
> Add new disables for libraries that aren't supported in buildroot and
> sort them for ease of maintenance.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
[--SNIP--]
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 74ac5a4..065f33d 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 6.9.4-6
> +IMAGEMAGICK_VERSION = 7.0.2-0

Our oldest bug is about imagemagick not finding ghostscript fonts:
    https://patchwork.ozlabs.org/patch/484767/

Since you just bumped imagemagick, did you have a look if it still
applies?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

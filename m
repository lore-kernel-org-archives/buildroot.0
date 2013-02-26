From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Feb 2013 18:56:02 +0100
Subject: [Buildroot] [git commit branch/next] exfat-utils: new package
In-Reply-To: <20130222231134.2F5C79AC62@busybox.osuosl.org>
References: <20130222231134.2F5C79AC62@busybox.osuosl.org>
Message-ID: <201302261856.03004.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Saturday 23 February 2013 Peter Korsgaard wrote:
[--SNIP--]
> --- /dev/null
> +++ b/package/exfat-utils/exfat-utils.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# exfat-utils
> +#
> +#############################################################
> +
> +EXFAT_UTILS_VERSION = 1.0.1
> +EXFAT_UTILS_SITE = http://exfat.googlecode.com/files
> +EXFAT_UTILS_DEPENDENCIES = host-scons
> +EXFAT_UTILS_LICENSE = GPLv3

In fact, it is GPLv3+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

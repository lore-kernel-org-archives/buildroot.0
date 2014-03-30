From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 19:21:19 +0200
Subject: [Buildroot] [PATCH] Add agg (Anti-Grain Geometry) package
In-Reply-To: <1395411147-14354-1-git-send-email-julien.boibessot@free.fr>
References: <1395411147-14354-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140330172119.GE3152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2014-03-21 15:12 +0100, julien.boibessot at free.fr spake thusly:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
[--SNIP--]
> diff --git a/package/agg/agg.mk b/package/agg/agg.mk
> new file mode 100644
> index 0000000..05be931
> --- /dev/null
> +++ b/package/agg/agg.mk
> @@ -0,0 +1,40 @@
> +###############################################################################
> +#
> +# agg
> +#
> +###############################################################################
> +
> +AGG_VERSION = 2.5
> +AGG_SITE = http://www.antigrain.com/
> +AGG_LICENSE = GPLv3+
> +AGG_LICENSE_FILES = COPYING

The file is named 'copying', all in lower-case, and contains the text of
the GPLv2, not the v3.

Besides, all the files I looked at refer to the GPLv2 with the 'or later'
clause.

Some files seem to be MIT-like, eg. gpc/gpc.c

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Jun 2014 23:25:42 +0200
Subject: [Buildroot] [PATCH 1/1] Adding pifmrds package
In-Reply-To: <1403210695-7526-1-git-send-email-limpens@gmail.com>
References: <1403210695-7526-1-git-send-email-limpens@gmail.com>
Message-ID: <20140619212542.GE3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

I forgot a few things...

On 2014-06-19 22:44 +0200, Eric Limpens spake thusly:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
[--SNIP--]
> diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
> new file mode 100644
> index 0000000..5a91089
> --- /dev/null
> +++ b/package/pifmrds/pifmrds.mk
> @@ -0,0 +1,18 @@
> +PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
> +PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
> +PIFMRDS_INSTALL_TARGET = YES
> +PIFMRDS_AUTORECONF = YES
> +PIFMRDS_DEPENDENCIES += libsndfile

You forgot the licensing terms:

    PIFMRDS_LICENSE = GPLv3+
    PIFMRDS_LICENSE_FILES = LICENSE

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

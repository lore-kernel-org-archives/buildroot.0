From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Fri, 27 Apr 2012 15:01:28 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2012.04
In-Reply-To: <1335436472-2085-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335436472-2085-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120427150128.77d4636b@eb-e6520>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le Thu, 26 Apr 2012 07:34:32 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../uboot-tools-2011.03-drop-configh.patch         |   27 --------------------
>  ...ot-tools-2012.04-hostcflags-override-fix.patch} |    0
>  package/uboot-tools/uboot-tools.mk                 |    2 +-
>  3 files changed, 1 insertions(+), 28 deletions(-)
>  delete mode 100644 package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
> .../...
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -1,4 +1,4 @@
> -UBOOT_TOOLS_VERSION = 2011.03
> +UBOOT_TOOLS_VERSION = 2012.04
>  UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>  UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>  
here is a message from Wolfgang Denk on oe-core's mailing list :
"Please update and use v2012.04.01 instead.  This is a bug fix release
which fixes a nasty bug in the command line processing, which can
cause incorrect execution of commands and scripts."

Eric

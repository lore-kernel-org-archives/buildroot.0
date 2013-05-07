From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 May 2013 23:38:30 +0200
Subject: [Buildroot] [PATCH] msmtp: bump to version 1.4.31
In-Reply-To: <1367962161-18531-1-git-send-email-gilles.talis@gmail.com>
References: <1367962161-18531-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130507213830.GE22338@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 07, 2013 at 02:29:21PM -0700, Gilles Talis wrote:
> Also added license information
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/msmtp/msmtp.mk |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index 87a2fbb..e99ab3d 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -4,9 +4,11 @@
>  #
>  #############################################################
>  
> -MSMTP_VERSION = 1.4.27
> +MSMTP_VERSION = 1.4.31
>  MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
>  MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
> +MSMTP_LICENSE = GPLv3+
> +MSMTP_LICENSE_FILES = COPYING
>  
>  MSMTP_DEPENDENCIES += host-pkgconf
>  
> -- 
> 1.7.4.1
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

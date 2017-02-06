From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Feb 2017 14:35:44 +0100
Subject: [Buildroot] [PATCH next] lftp: bump version to 4.7.4
In-Reply-To: <20161116174010.11273-1-Vincent.Riera@imgtec.com>
References: <20161116174010.11273-1-Vincent.Riera@imgtec.com>
Message-ID: <20170206133544.GA20179@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vciente, All,

On 2016-11-16 17:40 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/lftp/lftp.hash | 4 ++--
>  package/lftp/lftp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
> index 57a5205..0e0f927 100644
> --- a/package/lftp/lftp.hash
> +++ b/package/lftp/lftp.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated
> -sha256 3b22259cdc4c1a6ae349057d16bda4b4816929e04d223242ab8927bc31a48e7c  lftp-4.7.3.tar.xz
> +# Locally calculated after checking gpg signature
> +sha256 bf67c4d128b6f769a4082947376a9679c5ee3463a24ab761a0757f75d70bd92c  lftp-4.7.4.tar.xz
> diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
> index 802bbc7..a7e1f92 100644
> --- a/package/lftp/lftp.mk
> +++ b/package/lftp/lftp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LFTP_VERSION = 4.7.3
> +LFTP_VERSION = 4.7.4

This is causing build failures in static builds:
    http://autobuild.buildroot.org/results/025/02570aadbf84809e194e4bcc8f5bdfa26b77d849/

Care to have a look? ;-)

Regards,
Yann E. MORIN.

>  LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
>  LFTP_SITE = http://lftp.yar.ru/ftp
>  LFTP_LICENSE = GPLv3+
> -- 
> 2.10.1
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

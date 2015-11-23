From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 16:53:22 +0100
Subject: [Buildroot] [PATCH] nmap: bump version to 7.00
In-Reply-To: <1448292906-11926-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448292906-11926-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151123155322.GB3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-11-23 15:35 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nmap/nmap.hash | 2 +-
>  package/nmap/nmap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
> index 8c8da00..c7b3cf5 100644
> --- a/package/nmap/nmap.hash
> +++ b/package/nmap/nmap.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256 8fa11e9e203ce2d81a207db5ca4f110a525f6c01c1dd0018325a7112a51aa591 nmap-6.47.tar.bz2
> +sha256 9f442301c615c608a385831c3505cdfed9b0795cd100f1a258b04509802802ae  nmap-7.00.tar.bz2
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 1a0e977..c4fbe72 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NMAP_VERSION = 6.47
> +NMAP_VERSION = 7.00
>  NMAP_SITE = http://nmap.org/dist
>  NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>  NMAP_DEPENDENCIES = libpcap pcre
> -- 
> 2.4.10
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

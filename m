From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 23:10:02 +0200
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.4
In-Reply-To: <94b6205c8d5c2b1e81cdd0c89415862ade6d349c.1586783392.git.baruch@tkos.co.il>
References: <94b6205c8d5c2b1e81cdd0c89415862ade6d349c.1586783392.git.baruch@tkos.co.il>
Message-ID: <20200413211002.GE5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-04-13 16:09 +0300, Baruch Siach spake thusly:
> Format hash file with two spaces delimiter.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/grep/grep.hash | 6 +++---
>  package/grep/grep.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/grep/grep.hash b/package/grep/grep.hash
> index 4aa7b4ecb834..47bf550a2000 100644
> --- a/package/grep/grep.hash
> +++ b/package/grep/grep.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature
> -# http://ftp.gnu.org/gnu/grep/grep-3.3.tar.xz.sig
> +# http://ftp.gnu.org/gnu/grep/grep-3.4.tar.xz.sig
>  # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256 b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514  grep-3.3.tar.xz
> -sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> +sha256  58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb  grep-3.4.tar.xz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index cc80553eb915..ef1bbb44879c 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GREP_VERSION = 3.3
> +GREP_VERSION = 3.4
>  GREP_SITE = $(BR2_GNU_MIRROR)/grep
>  GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>  GREP_LICENSE = GPL-3.0+
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

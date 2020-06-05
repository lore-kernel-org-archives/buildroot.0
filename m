From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:43:44 +0200
Subject: [Buildroot] [PATCH] package/openssh: bump to version 8.3p1
In-Reply-To: <e0198b77a7a957c4e679b272b7c252f6f39d29ac.1591339765.git.baruch@tkos.co.il>
References: <e0198b77a7a957c4e679b272b7c252f6f39d29ac.1591339765.git.baruch@tkos.co.il>
Message-ID: <20200605204344.GQ13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-06-05 09:49 +0300, Baruch Siach spake thusly:
> Format hash file with two spaces separators.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/openssh/openssh.hash | 6 +++---
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 2f962d4337d0..1d7dc14fb62b 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-8.2 (base64 encoded)
> -sha256 43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671  openssh-8.2p1.tar.gz
> +# From https://www.openssh.com/txt/release-8.3 (base64 encoded)
> +sha256  f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2  openssh-8.3p1.tar.gz
>  # Locally calculated
> -sha256 73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
> +sha256  73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 2b9027818de1..515eec2c0359 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSSH_VERSION = 8.2p1
> +OPENSSH_VERSION = 8.3p1
>  OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>  OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
>  OPENSSH_LICENSE_FILES = LICENCE
> -- 
> 2.26.2
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

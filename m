From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 16:40:25 +0100
Subject: [Buildroot] [PATCH 2/3] glibc: set version 2.20 as default
In-Reply-To: <1423408027-49694-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208154024.GI4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-02-08 15:07 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/glibc/Config.in |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 37e108e..890d007 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -30,7 +30,7 @@ config BR2_PACKAGE_GLIBC
>  
>  choice
>  	prompt "glibc version"
> -	default BR2_GLIBC_VERSION_2_19
> +	default BR2_GLIBC_VERSION_2_20
>  
>  config BR2_GLIBC_VERSION_2_19
>  	bool "2.19"
> -- 
> 1.7.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 11:54:30 +0200
Subject: [Buildroot] [PATCH] package/stella: bump to version 6.1.2
In-Reply-To: <20200430210327.31784-1-sergio.prado@e-labworks.com>
References: <20200430210327.31784-1-sergio.prado@e-labworks.com>
Message-ID: <20200501095430.GR11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2020-04-30 18:03 -0300, Sergio Prado spake thusly:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/stella/stella.hash | 2 +-
>  package/stella/stella.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/stella/stella.hash b/package/stella/stella.hash
> index fb7c598a2c78..0b50636a00e5 100644
> --- a/package/stella/stella.hash
> +++ b/package/stella/stella.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  ddf53bb782c63c97c4e5d0fefa9eb256c62e0d5a328c78cc18f06eea45ba7369  stella-6.1.1-src.tar.xz
> +sha256  8086e57c231625f0b840ca361f493969247d20476cbb53609d778d37bda17c34  stella-6.1.2-src.tar.xz
>  sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
>  sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
> diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> index 74c131e72d86..53a1050cd8fa 100644
> --- a/package/stella/stella.mk
> +++ b/package/stella/stella.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STELLA_VERSION = 6.1.1
> +STELLA_VERSION = 6.1.2
>  STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
>  STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
>  STELLA_LICENSE = GPL-2.0+
> -- 
> 2.17.1
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

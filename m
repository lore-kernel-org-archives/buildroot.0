From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:43:34 +0200
Subject: [Buildroot] [PATCH] package/nano: bump to version 5.7
In-Reply-To: <20210517103942.1924675-1-francois.perrad@gadz.org>
References: <20210517103942.1924675-1-francois.perrad@gadz.org>
Message-ID: <20210518114334.GY2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-05-17 12:39 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nano/nano.hash | 4 ++--
>  package/nano/nano.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nano/nano.hash b/package/nano/nano.hash
> index cbb497722..532a68e0c 100644
> --- a/package/nano/nano.hash
> +++ b/package/nano/nano.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://www.nano-editor.org/dist/v5/nano-5.6.1.tar.xz.asc
> +# https://www.nano-editor.org/dist/v5/nano-5.7.tar.xz.asc
>  # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
> -sha256  760d7059e0881ca0ee7e2a33b09d999ec456ff7204df86bee58eb6f523ee8b09  nano-5.6.1.tar.xz
> +sha256  d4b181cc2ec11def3711b4649e34f2be7a668e70ab506860514031d069cccafa  nano-5.7.tar.xz
>  sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 77126fd4b..39d9be12b 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NANO_VERSION_MAJOR = 5
> -NANO_VERSION = $(NANO_VERSION_MAJOR).6.1
> +NANO_VERSION = $(NANO_VERSION_MAJOR).7
>  NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
>  NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
>  NANO_LICENSE = GPL-3.0+
> -- 
> 2.30.2
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

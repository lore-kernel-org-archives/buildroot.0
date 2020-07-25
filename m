From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 13:03:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgsasl: bump to version 1.8.1
In-Reply-To: <20200725101829.1192501-1-fontaine.fabrice@gmail.com>
References: <20200725101829.1192501-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725110316.GN2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-25 12:18 +0200, Fabrice Fontaine spake thusly:
> - Update hash of README
> - Update indentation in hash file (two spaces)
> 
> https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00000.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgsasl/libgsasl.hash | 8 ++++----
>  package/libgsasl/libgsasl.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
> index 82bfe339c6..57fd98fc95 100644
> --- a/package/libgsasl/libgsasl.hash
> +++ b/package/libgsasl/libgsasl.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after checking pgp signature
> -sha256	3adfb49f9c92a719dea855fd1840d698cde55d4648d332a69032ba8bea207720	libgsasl-1.8.0.tar.gz
> +sha256  19e2f90525c531010918c50bb1febef0d7115d620150cc66153b9ce73ff814e6  libgsasl-1.8.1.tar.gz
>  
>  # Hash for license files:
> -sha256	4eb54155afd4684d7e9423f6037e5cc887ae4d8818e83d3af93350ebd4a8e6eb	README
> -sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
> -sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
> +sha256  185b5b29a3febbfe1ab0b1ec6b1a26df630be97a17a99b5d305fdfff3344c117  README
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> index 9a625433ee..0cec9c73bd 100644
> --- a/package/libgsasl/libgsasl.mk
> +++ b/package/libgsasl/libgsasl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGSASL_VERSION = 1.8.0
> +LIBGSASL_VERSION = 1.8.1
>  LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
>  LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
>  LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
> -- 
> 2.27.0
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

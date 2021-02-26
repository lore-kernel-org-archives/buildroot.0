From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 23:11:17 +0100
Subject: [Buildroot] [PATCH/next] package/libxcrypt: bump version to
 4.4.18
In-Reply-To: <20210226082917.19599-1-guillaume.bressaix@gmail.com>
References: <20210226082917.19599-1-guillaume.bressaix@gmail.com>
Message-ID: <20210226221117.GC2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2021-02-26 09:29 +0100, guillaume.bressaix at gmail.com spake thusly:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Patch merged into mainline
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[--SNIP--]
> diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
> index b56ab6beaf..617bf55b46 100644
> --- a/package/libxcrypt/libxcrypt.hash
> +++ b/package/libxcrypt/libxcrypt.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256 7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07  libxcrypt-4.4.17.tar.gz
> +sha256 3801f0263a8596b15ec466343fc1fdc4ad4ec7416c51e038a3528fd47f3be01a  libxcrypt-4.4.18.tar.gz
>  sha256 f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING

So now there has been a conflict with the license hash file, so I've
fixed that, and expanded the commit log accordingly.

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index ccbb1a282c..fd33fb7ab5 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXCRYPT_VERSION = 4.4.17
> +LIBXCRYPT_VERSION = 4.4.18
>  LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
>  LIBXCRYPT_LICENSE = LGPL-2.1+
>  LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
> -- 
> 2.20.1
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

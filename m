From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 23:13:30 +0100
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.11.3
In-Reply-To: <20210104210137.2221-1-francois.perrad@gadz.org>
References: <20210104210137.2221-1-francois.perrad@gadz.org>
Message-ID: <20210104221330.GI1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-01-04 22:01 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

I also applied those few others:
    [PWID   ] Short hash    Titlehttps://github.com/harfbuzz/harfbuzz/pull/2692
    [1422260] d64da55160ce  package/spi-tools: bump to version 0.8.6
    [1422259] b55894b6dbe4  package/pango: bump to version 1.48.0
    [1422258] 0cf80c53ae94  package/lighttpd: bump to version 1.4.58
    [1422257] c6655a0e62a4  package/libsecret: bump to version 0.20.4
    [1422255] 5bb5f077a134  package/harfbuzz: bump to version 2.7.4
    [1422254] 9425ec501f8e  package/dash: bump to version 0.5.11.3

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/dash/dash.hash | 2 +-
>  package/dash/dash.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dash/dash.hash b/package/dash/dash.hash
> index 069a7b179..24cc7318b 100644
> --- a/package/dash/dash.hash
> +++ b/package/dash/dash.hash
> @@ -1,4 +1,4 @@
>  # From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
> -sha256  00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f  dash-0.5.11.2.tar.gz
> +sha256  62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a  dash-0.5.11.3.tar.gz
>  # Locally calculated
>  sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 88caa6609..1712dcf59 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DASH_VERSION = 0.5.11.2
> +DASH_VERSION = 0.5.11.3
>  DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>  DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>  DASH_LICENSE_FILES = COPYING
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

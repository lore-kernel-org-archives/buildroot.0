From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:24:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 2.30.6
In-Reply-To: <20210322221948.1380276-1-aperez@igalia.com>
References: <20210322221948.1380276-1-aperez@igalia.com>
Message-ID: <20210328082449.GJ24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-03-23 00:19 +0200, Adrian Perez de Castro spake thusly:
> This is a minor release which provides fixes for CVE-2020-27918,
> CVE-2020-29623, CVE-2021-1765, CVE-2021-1789, CVE-2021-1799,
> CVE-2021-1801, and CVE-2021-1870.
> 
> Full release notes can be found at:
> 
>   https://webkitgtk.org/2021/03/18/webkitgtk2.30.6-released.html
> 
> An accompanying security advisory has been published at:
> 
>   https://webkitgtk.org/security/WSA-2021-0002.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 3869058d75..d85a7f46f2 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.30.5.tar.xz.sums
> -md5  c8291af0c5102fff1f73e67f0bff6c87  webkitgtk-2.30.5.tar.xz
> -sha1  4fc8753786d7762a3c4ecdc7ea11fc38b5468d6f  webkitgtk-2.30.5.tar.xz
> -sha256  7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f  webkitgtk-2.30.5.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.30.6.tar.xz.sums
> +md5  11148c4ed400c58fe330ac94208cbc4d  webkitgtk-2.30.6.tar.xz
> +sha1  aaaf9b0f1780f3eae104ae0d3ad15b3e19cf6e8d  webkitgtk-2.30.6.tar.xz
> +sha256  50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e  webkitgtk-2.30.6.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 8a3be4c95e..1720ffc7d6 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.30.5
> +WEBKITGTK_VERSION = 2.30.6
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.31.0
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

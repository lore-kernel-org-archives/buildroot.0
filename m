From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:36:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.2.7
In-Reply-To: <20200318212130.289667-1-bernd.kuhls@t-online.de>
References: <20200318212130.289667-1-bernd.kuhls@t-online.de>
Message-ID: <20200320203604.GN10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-03-18 22:21 +0100, Bernd Kuhls spake thusly:
> Release notes: https://blog.torproject.org/new-releases-03510-0419-0427
> 
> Fixes CVE-2020-10592 & CVE-2020-10593.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master (I just fixed spaces in the hash file), thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tor/tor.hash | 2 +-
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 94cb8325ff..41c0f81abc 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 0500102433849bbe3231c590973d126c2d2d6b3943b4b9f9962bdb108436e6c4  tor-0.4.2.6.tar.gz
> +sha256 06a1d835ddf382f6bca40a62e8fb40b71b2f73d56f0d53523c8bd5caf9b3026d  tor-0.4.2.7.tar.gz
>  sha256 ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index d1caf35a9a..09f780d3f5 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.2.6
> +TOR_VERSION = 0.4.2.7
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
> -- 
> 2.25.0
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

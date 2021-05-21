From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:35:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.5
In-Reply-To: <20210521185544.287236-1-fontaine.fabrice@gmail.com>
References: <20210521185544.287236-1-fontaine.fabrice@gmail.com>
Message-ID: <20210521203503.GT3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-21 20:55 +0200, Fabrice Fontaine spake thusly:
> https://www.wireshark.org/security/wnpa-sec-2021-04.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've added a reference to the corresponding CVE: CVE-2021-22207.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 71703a2a8b..57290b9060 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.4.txt
> -sha1  fa5c553596dcc6a59735f96a9a0845e3c40abab2  wireshark-3.4.4.tar.xz
> -sha256  729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29  wireshark-3.4.4.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.5.txt
> +sha1  d01a9b5f58206fb458fe9fc2dac88ad0ea7152ce  wireshark-3.4.5.tar.xz
> +sha256  de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333  wireshark-3.4.5.tar.xz
>  
>  # Locally calculated
>  sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 8cdc7305d0..3d656cf349 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 3.4.4
> +WIRESHARK_VERSION = 3.4.5
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
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

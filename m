From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:31:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/opkg: bump to version 0.4.5
In-Reply-To: <20210624124739.30531-1-ryanbarnett3@gmail.com>
References: <20210624124739.30531-1-ryanbarnett3@gmail.com>
Message-ID: <20210629203132.GW2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2021-06-24 07:47 -0500, Ryan Barnett spake thusly:
> Along with version bump, update hash file to two space format and
> switch to HTTPS URL.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opkg/opkg.hash | 4 ++--
>  package/opkg/opkg.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
> index b1ead67a11..b0c0ba6574 100644
> --- a/package/opkg/opkg.hash
> +++ b/package/opkg/opkg.hash
> @@ -1,4 +1,4 @@
>  # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
> -sha256 86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb31e1c4e151e106  opkg-0.4.2.tar.gz
> +sha256  a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e  opkg-0.4.5.tar.gz
>  # Locally calculated
> -sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index e25e51b9e6..501edcf8af 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -OPKG_VERSION = 0.4.2
> -OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
> +OPKG_VERSION = 0.4.5
> +OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
>  OPKG_DEPENDENCIES = host-pkgconf libarchive
>  OPKG_LICENSE = GPL-2.0+
>  OPKG_LICENSE_FILES = COPYING
> -- 
> 2.25.1
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

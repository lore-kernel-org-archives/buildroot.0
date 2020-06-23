From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 23:38:20 +0200
Subject: [Buildroot] [PATCH v2] pru-software-support: bump to latest
 version 5.7.0
In-Reply-To: <20200623002515.9022-1-ashcharles@gmail.com>
References: <20200621214315.GS2351@scaer>
 <20200623002515.9022-1-ashcharles@gmail.com>
Message-ID: <20200623213820.GF2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ash, All,

On 2020-06-22 20:25 -0400, Ash Charles spake thusly:
> Update to the latest version of the PRU software support [1].
> 
> There are minor changes to the license file mostly dates and versions --
> notably pulling in several Linux kernel 5.4 header files in place of the
> 4.19 versions.  As there is no longer a dependency on the kernel types.h
>   header, there's no longer a GPL-2.0 licensed component.
> 
> [1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package
> 
> Signed-off-by: Ash Charles <ashcharles@gmail.com>

Applied to master (after I removed the useless comment that just repeats
the URL). Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pru-software-support/pru-software-support.hash | 4 ++--
>  package/pru-software-support/pru-software-support.mk   | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index 9deb3e6661..cd81488e1b 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,3 +1,3 @@
>  # Locally-calculated hash
> -sha256  d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e  pru-software-support-package-v5.6.0.tar.gz
> -sha256  a68530804624227e4f2e007eacb5c2d616695426082e895ee1e2d77d3833f5f7  PRU-Package-v6.0-Manifest.html
> +sha256  57e47128dc5437c5a64d4ef94f419d9ea38e894c0c31ab10cad99c0da614b296  pru-software-support-package-v5.7.0.tar.gz
> +sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index b56ac0af12..b54d2dac11 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = 5.6.0
> -# https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot/pru-software-support-package-5.6.0.tar.gz
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.7.0
> +# https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot/pru-software-support-package-5.7.0.tar.gz
>  PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
>  PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
> -PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
> -PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.0-Manifest.html
> +PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
> +PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.1-Manifest.html
>  PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
>  HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
>  
> -- 
> 2.26.2
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

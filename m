From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 13:45:29 +0200
Subject: [Buildroot] [PATCH]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
In-Reply-To: <20210621210820.364630-1-thomas.petazzoni@bootlin.com>
References: <20210621210820.364630-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210625114529.GA104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 23:08 +0200, Thomas Petazzoni spake thusly:
> The br-arm-internal-glibc.config is generally used as a configuration
> to test the bleeding edge versions of components. However, it has been
> lagging behind somewhat, so let's bring it up-to-date:
> 
>  - Binutils 2.36.x
>  - GCC 11.x
> 
> Let the fun begin in the autobuilders!

Wee!

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../config-fragments/autobuild/br-arm-internal-glibc.config   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
> index ea6df7fbd9..fb930cbef7 100644
> --- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
> +++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
> @@ -1,6 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> -BR2_BINUTILS_VERSION_2_34_X=y
> -BR2_GCC_VERSION_10_X=y
> +BR2_BINUTILS_VERSION_2_36_X=y
> +BR2_GCC_VERSION_11_X=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
> -- 
> 2.31.1
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

From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jun 2016 21:59:29 +0200
Subject: [Buildroot] [PATCH 3/6] glibc: remove additional occurrences of
 eglibc
In-Reply-To: <1465422059-22254-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <fe23b697-dea8-99f9-f2b7-bfc76e9dca54@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:40, Thomas Petazzoni a ?crit :
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Should we also remove eglibc occurrences from toolchain/Config.in,
toolchain-common.in and toolchain-external ?
Even if we can still use an eglibc as external toolchain.

If no, then:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  package/glibc/glibc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 7adfa94..2c32e65 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# glibc/eglibc
> +# glibc
>  #
>  ################################################################################
>  
> @@ -64,7 +64,7 @@ endif
>  #  2. We have to execute the configure script with bash and not sh.
>  #
>  # Note that as mentionned in
> -# http://patches.openembedded.org/patch/38849/, eglibc/glibc must be
> +# http://patches.openembedded.org/patch/38849/, glibc must be
>  # built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
>  define GLIBC_CONFIGURE_CMDS
>  	mkdir -p $(@D)/build
> 

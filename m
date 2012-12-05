From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 14:40:17 -0800
Subject: [Buildroot] [PATCH] package/crosstool-ng: bumpimg default GCC
	version to 4.6.3
In-Reply-To: <1354736519-18173-2-git-send-email-c.schoenert@t-online.de>
 (Carsten Schoenert's message of "Wed, 5 Dec 2012 20:41:59 +0100")
References: <1354736519-18173-1-git-send-email-c.schoenert@t-online.de>
 <1354736519-18173-2-git-send-email-c.schoenert@t-online.de>
Message-ID: <87lidc86ni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@t-online.de>
 Carsten> This bumps the GCC version from 4.4.6 to 4.6.3 to for
 Carsten> *.config-eglibc
 Carsten> *.config-glibc
 Carsten> *.config-uClibc
 Carsten> be equal to the default GCC setting in buildroot as well in addition to
 Carsten> commit b855154ee8683e87afa08c6cc50b716d22879922.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
 Carsten> ---
 Carsten>  toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc |    2 +-
 Carsten>  toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc  |    2 +-
 Carsten>  toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc |    2 +-
 Carsten>  3 files changed, 3 insertions(+), 3 deletions(-)

 Carsten> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
 Carsten> index 1b523ec..9ad1c5b 100644
 Carsten> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
 Carsten> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
 Carsten> @@ -265,7 +265,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 Carsten>  # C compiler
 Carsten>  #
 Carsten>  CT_CC="gcc"
 Carsten> -CT_CC_VERSION="4.4.6"
 Carsten> +CT_CC_VERSION="4.6.3"
 Carsten>  CT_CC_gcc=y
 Carsten>  # CT_CC_V_4_7_2 is not set
 Carsten>  # CT_CC_V_4_6_3 is not set

Hmm, don't you also need to set CT_CC_V_4_6_3=y (and unset
CT_CC_V_4_4_6)?

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Oct 2012 09:19:00 +0200
Subject: [Buildroot] [PATCH] toolchain/binutils: add version 2.23
In-Reply-To: <1350934595-24165-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 22 Oct 2012 16:36:35 -0300")
References: <1350934595-24165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <876261oduj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/binutils/Config.in.host                    |    5 +++
 Gustavo>  package/binutils/binutils-2.23/120-sh-conf.patch   |   29 +++++++++++++++
 Gustavo>  .../binutils-2.23/300-001_ld_makefile_patch.patch  |   24 +++++++++++++
 Gustavo>  .../300-012_check_ldrunpath_length.patch           |   21 +++++++++++
 Gustavo>  package/binutils/binutils-2.23/500-sysroot.patch   |   37 ++++++++++++++++++++
 Gustavo>  5 files changed, 116 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/binutils/binutils-2.23/120-sh-conf.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23/300-001_ld_makefile_patch.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23/300-012_check_ldrunpath_length.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23/500-sysroot.patch

 Gustavo> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
 Gustavo> index a13d61b..26c5f73 100644
 Gustavo> --- a/package/binutils/Config.in.host
 Gustavo> +++ b/package/binutils/Config.in.host
 Gustavo> @@ -31,6 +31,10 @@ choice
 Gustavo>  	config BR2_BINUTILS_VERSION_2_22
 Gustavo>  		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 Gustavo>  		bool "binutils 2.22"
 Gustavo> +	

This line should not be indented with a <tab>. Otherwise it looks good,
committed - Thanks.

-- 
Bye, Peter Korsgaard

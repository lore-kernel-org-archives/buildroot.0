From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 23:02:43 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 6 Jan 2013 21:56:20 +0100")
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
Message-ID: <87ip7ac6m4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> replacement for memcpy and memset functionality
 Maxime> This package was originally found at : https://github.com/huceke/buildroot-rbp
 Maxime> By gimli <ebsi4711@gmail.com>

 Maxime> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 Maxime> ---
 Maxime>  package/Config.in          |    1 +
 Maxime>  package/libcofi/Config.in  |    8 ++++++++
 Maxime>  package/libcofi/libcofi.mk |   20 ++++++++++++++++++++
 Maxime>  3 files changed, 29 insertions(+)
 Maxime>  create mode 100644 package/libcofi/Config.in
 Maxime>  create mode 100644 package/libcofi/libcofi.mk

 Maxime> diff --git a/package/Config.in b/package/Config.in
 Maxime> index 047af8d..9b50f4b 100644
 Maxime> --- a/package/Config.in
 Maxime> +++ b/package/Config.in
 Maxime> @@ -511,6 +511,7 @@ endmenu
 Maxime>  menu "Other"
 Maxime>  source "package/apr/Config.in"
 Maxime>  source "package/apr-util/Config.in"
 Maxime> +source "package/libcofi/Config.in"
 Maxime>  source "package/classpath/Config.in"
 Maxime>  source "package/fftw/Config.in"
 Maxime>  source "package/libargtable2/Config.in"
 Maxime> diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
 Maxime> new file mode 100644
 Maxime> index 0000000..b900b69
 Maxime> --- /dev/null
 Maxime> +++ b/package/libcofi/Config.in
 Maxime> @@ -0,0 +1,8 @@
 Maxime> +config BR2_PACKAGE_LIBCOFI
 Maxime> +	bool "libcofi"
 Maxime> +	depends on BR2_arm
 Maxime> +	help
 Maxime> +	  A replacement for memcpy and memset functionality for the Raspberry Pi

I've word wrapped this and committed, thanks.

-- 
Bye, Peter Korsgaard

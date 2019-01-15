From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 15 Jan 2019 15:49:01 +0100
Subject: [Buildroot] [PATCH] package/rtc-tools: new package
In-Reply-To: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
References: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190115144901.GA28293@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/2019 10:32:29+0100, Thomas Petazzoni wrote:
> diff --git a/package/rtc-tools/Config.in b/package/rtc-tools/Config.in
> new file mode 100644
> index 0000000000..78f5c06049
> --- /dev/null
> +++ b/package/rtc-tools/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RTC_TOOLS
> +	bool "rtc-tools"
> +	help
> +	  This package provide a set of user-space tools that can be
> +	  used to manipulate Real Time Clock Devices.
> +
> +	  https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/
> diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
> new file mode 100644
> index 0000000000..81be1afe4e
> --- /dev/null
> +++ b/package/rtc-tools/rtc-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
> +sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
> diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
> new file mode 100644
> index 0000000000..5e9d040b27
> --- /dev/null
> +++ b/package/rtc-tools/rtc-tools.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# rtc-tools
> +#
> +################################################################################
> +
> +RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7

Should I tag a release or are you fine with the git hash?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

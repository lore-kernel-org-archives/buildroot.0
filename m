From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:30:08 +0100
Subject: [Buildroot] [v2 1/2] libdvbpsi: new package
In-Reply-To: <1451486755-7314-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1451482256-11816-1-git-send-email-pieterjan.camerlynck@gmail.com>
 <1451486755-7314-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20151230233008.087dca2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieterjan Camerlynck,

On Wed, 30 Dec 2015 15:45:54 +0100, Pieterjan Camerlynck wrote:

> diff --git a/package/libdvbpsi/Config.in b/package/libdvbpsi/Config.in
> new file mode 100644
> index 0000000..2a27964
> --- /dev/null
> +++ b/package/libdvbpsi/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBDVBPSI
> +	bool "libdvbpsi"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  libdvbpsi is a simple library designed for decoding and
> +	  generation of MPEG TS and DVB PSI tables according to standards
> +	  ISO/IEC 13818 and ITU-T H.222.0.
> +
> +	  http://www.videolan.org/developers/libdvbpsi.html

You forgot the Config.in comment here about the thread dependency.

I've added it and applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

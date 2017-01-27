From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 08:38:04 +1300
Subject: [Buildroot] [PATCH 05/52] package/libgsm: new package
In-Reply-To: <a69e60d569a8bc06e8d07029d9200469187c596d.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
 <a69e60d569a8bc06e8d07029d9200469187c596d.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <20170128083804.685834d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Dec 2016 11:29:06 +0100, Yann E. MORIN wrote:

> diff --git a/package/libgsm/Config.in b/package/libgsm/Config.in
> new file mode 100644
> index 0000000..b883329
> --- /dev/null
> +++ b/package/libgsm/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBGSM
> +	bool "libgsm"
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  Shared libraries for GSM 06.10 lossy speech compression.
> +
> +	  http://www.quut.com/gsm
> +
> +comment "libgsm needs a toolchain w/ shared libraries"

The normal comment for this is "w/ dynamic library", so I've fixed that
and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

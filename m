From: Davide Viti <zinosat@tiscali.it>
Date: Sun, 20 Apr 2014 10:56:36 +0200
Subject: [Buildroot] [v4,2/2] canfestival: new package
In-Reply-To: <1397410895-2290-2-git-send-email-s.martin49@gmail.com>
References: <1397410895-2290-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140420085636.GA2055@zinosat.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a few cosmetic things

On Sun, Apr 13, 2014 at 07:41:35PM +0200, Samuel Martin wrote:
[...]
> @@ -0,0 +1,101 @@
> +config BR2_PACKAGE_CANFESTIVAL
> +	bool "CanFestival"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
> +	help
> +	  CanFestival is an OpenSource CANOpen framework, licensed with GPLv2
> +	  and LGPLv2.
> +
> +	  http://www.canfestival.org
> +

here help comment is ended with a dot

> +if BR2_PACKAGE_CANFESTIVAL
> +
> +choice
> +	prompt "driver to use"
> +	default BR2_PACKAGE_CANFESTIVAL_SOCKET
> +
> +config BR2_PACKAGE_CANFESTIVAL_ANAGATE_LINUX
> +	bool "anagate_linux"
> +	help
> +	  AnaGate CAN(duo) driver for linux
> +
> +	  http://www.anagate.de/en/index.html
> +

here the sentence is not ended with a dot

> +config BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
> +	bool "peak_linux"
> +	help
> +	  Linux build host installed Peak driver and library
> +
> +	  http://www.peak-system.com/linux/
> +

missing dot at the end of the help sentence
The description is not very clear to me

> +config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
> +	bool "virtual"
> +	help
> +	  Unix pipe based virtual can driver
> +

I'd use capital CAN
missing dot

> +config BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL
> +	bool "virtual_kernel"
> +	help
> +	  Kernel module virtual can driver
> +

I'd use capital CAN
missing dot

> +config BR2_PACKAGE_CANFESTIVAL_LINCAN
> +	bool "lincan"
> +	help
> +	  Lincan driver
> +
> +	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
> +

missing dot

> +config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
> +	bool "can4linux"
> +	help
> +	  Can4linux driver
> +
> +	  http://www.port.de/engl/canprod/hw_can4linux.html
> +

missing dot

> +config BR2_PACKAGE_CANFESTIVAL_COPCICAN_LINUX
> +	bool "copcican_linux"
> +	help
> +	  User space driver interface for CO-PCICAN card
> +
> +	  http://www.cosateq.com/
> +

missing dot

> +config BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI
> +	bool "copcican_comedi"
> +	help
> +	  COMEDI driver interface for CO-PCICAN card
> +
> +	  http://www.cosateq.com/
> +

missing dot


regards,
Davide

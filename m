From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 22:57:54 +0100
Subject: [Buildroot] [PATCH 2/4] bcusdk: new package
In-Reply-To: <1364160848-15168-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 22:34:06 +0100")
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364160848-15168-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87boa8h34t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Gregory Hermant <gregory.hermant@calao-systems.com>
 Thomas> [Thomas: various fixes/improvements]
 Thomas> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> +config BR2_PACKAGE_BCUSDK
 Thomas> +	bool "bcusdk"
 Thomas> +	depends on BR2_INSTALL_LIBSTDCPP
 Thomas> +	select BR2_PACKAGE_LIBPTHSEM
 Thomas> +	help
 Thomas> +	  A free development environment for the Bus Coupling Units of
 Thomas> +	  the European Installation Bus.
 Thomas> +
 Thomas> +	  The European Installation Bus EIB is a home and building
 Thomas> +	  automation bus system. It is optimized for low-speed control
 Thomas> +	  applications like lighting and blinds control.
 Thomas> +
 Thomas> +	  BCUs (Bus Coupling Units) are standardized, generic
 Thomas> +	  platforms for embedded EIB devices. They include the entire
 Thomas> +	  physical layer network interface, power supply and a
 Thomas> +	  microcontroller with an implementation of the EIB protocol
 Thomas> +	  stack stored in the ROM.
 Thomas> +
 Thomas> +	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
 Thomas> +
 Thomas> +comment "bcusdk requires a toolchain with C++ "
 Thomas> +	depends on !BR2_INSTALL_LIBSTDCPP

We normall add 'support, E.G. C++ support'

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 23:10:34 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <175bbe60c696b921f074714aac68427ae0561b22.1357505417.git.maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 6 Jan 2013 21:56:21 +0100")
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <175bbe60c696b921f074714aac68427ae0561b22.1357505417.git.maxime.hadjinlian@gmail.com>
Message-ID: <877gnqc691.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> +++ b/package/rpi-userland/Config.in
 Maxime> @@ -0,0 +1,18 @@
 Maxime> +config BR2_PACKAGE_RPI_USERLAND
 Maxime> +	bool "RaspberryPi userland"
 Maxime> +	depends on BR2_INSTALL_LIBSTDCPP
 Maxime> +	depends on BR2_LARGEFILE

Ohh, and you forgot the 'depends on BR2_arm' - I've added it.

-- 
Bye, Peter Korsgaard

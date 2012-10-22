From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 15:04:34 +0200
Subject: [Buildroot] [PATCH 04/12] libnetfilter_cthelper: add new package
In-Reply-To: <1350909989-1012-4-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20121022150434.4443f61e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 22 Oct 2012 09:46:21 -0300, Gustavo Zacarias wrote:

> --- /dev/null
> +++ b/package/libnetfilter_cthelper/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBNETFILTER_CTHELPER
> +	bool "libnetfilter_cthelper"
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_LIBMNL
> +	help
> +	  libnetfilter_cthelper is the userspace library that provides the programming interface to the user-space helper infrastructure available since Linux kernel 3.6.

Line wrapping needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

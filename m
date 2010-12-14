From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 15:17:49 +0100
Subject: [Buildroot] [PATCH] New package: can-utils
In-Reply-To: <4D0778E5.9010401@visionsystems.de>
References: <4D0778E5.9010401@visionsystems.de>
Message-ID: <20101214151749.4e529f54@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Tue, 14 Dec 2010 15:02:13 +0100
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> +	  SocketCAN is a set of open source CAN drivers and a networking stack. This package provides various
> +	  tools for this stack.

Please wrap at ~80.

> Index: b/package/can-utils/can-utils.mk
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ b/package/can-utils/can-utils.mk	2010-12-14 14:40:07.000000000 +0100
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# can-utils
> +#
> +#############################################################
> +
> +CAN_UTILS_VERSION = HEAD

We need a fixed version, not a random HEAD one. Pick the latest
revision you tested.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

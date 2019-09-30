From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:58:50 +0200
Subject: [Buildroot] [PATCH 07/08] package/python-channels: new package
In-Reply-To: <20190804011631.86261-8-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-8-aduskett@gmail.com>
Message-ID: <20190930215850.1583ca21@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 21:16:30 -0400
aduskett at gmail.com wrote:

> diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
> new file mode 100644
> index 0000000000..09a0a6049a
> --- /dev/null
> +++ b/package/python-channels/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_PYTHON_CHANNELS
> +	bool "python-channels"
> +	select BR2_PACKAGE_PYTHON_DJANGO # runtime
> +	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
> +	select BR2_PACKAGE_PYTHON_DAPHNE # runtime

Alphabetic ordering + missing BR2_PACKAGE_PYTHON3 dependency.

I fixed these, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

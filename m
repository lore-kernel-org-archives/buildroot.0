From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:40:49 +0200
Subject: [Buildroot] [PATCH v3] python-pymodbus: new package
In-Reply-To: <1521033470-3351-1-git-send-email-hyfinglists@googlemail.com>
References: <1521033470-3351-1-git-send-email-hyfinglists@googlemail.com>
Message-ID: <20180325234049.3cc8e609@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Wed, 14 Mar 2018 14:17:50 +0100, hyfinglists at gmail.com wrote:
> diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
> new file mode 100644
> index 0000000..6501809
> --- /dev/null
> +++ b/package/python-pymodbus/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PYTHON_PYMODBUS
> +	bool "python-pymodbus"
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	help
> +	  Pymodbus is a full Modbus protocol implementation.

I've added an URL to the upstream web site here, and applied your patch
to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

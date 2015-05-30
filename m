From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 May 2015 09:27:21 +0200
Subject: [Buildroot] [PATCH] package/python-can: new package
In-Reply-To: <1432890762-24842-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1432890762-24842-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150530092721.525134f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 29 May 2015 11:12:42 +0200, Angelo Compagnucci wrote:

> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> new file mode 100644
> index 0000000..50477a3
> --- /dev/null
> +++ b/package/python-can/python-can.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-can
> +#
> +################################################################################
> +
> +PYTHON_CAN_VERSION = ae5b6cf
> +PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can
> +PYTHON_CAN_SITE_METHOD = hg
> +PYTHON_CAN_LICENSE = GPLv3

License is actually LGPLv3.

> +PYTHON_CAN_LICENSE_FILES = LICENSE.txt
> +PYTHON_CAN_DEPENDENCIES = python
> +PYTHON_CAN_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))

Otherwise, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

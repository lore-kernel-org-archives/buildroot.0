From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:19:27 +0200
Subject: [Buildroot] [PATCH v4 3/7] boot/optee-os: bump version to 3.5.0
In-Reply-To: <20190514085319.9031-3-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-3-etienne.carriere@linaro.org>
Message-ID: <20190514181927.68d53f22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 May 2019 10:53:15 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> new file mode 100644
> index 0000000000..167f96475d
> --- /dev/null
> +++ b/boot/optee-os/optee-os.hash
> @@ -0,0 +1,4 @@
> +# From https://github.com/OP-TEE/optee_os/archive/3.5.0.tar.gz
> +sha256 a02fe8e7fdee9653e9207059071735a839b1255fdaf311a2a6cfd185a4cee6a2  optee-os-3.5.0.tar.gz
> +# Locally computed
> +sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE

This hash was wrong: you did not test it with "make legal-info".

I fixed it and applied to next. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

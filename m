From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:03:33 +0200
Subject: [Buildroot] [PATCH 2/4] package/python-pluggy: new package
In-Reply-To: <20200429224225.2454330-3-m.niestroj@grinn-global.com>
References: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
 <20200429224225.2454330-3-m.niestroj@grinn-global.com>
Message-ID: <20200827230333.5b750a9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Thu, 30 Apr 2020 00:42:23 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> new file mode 100644
> index 0000000000..620983fe84
> --- /dev/null
> +++ b/package/python-pluggy/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PLUGGY
> +	bool "python-pluggy"
> +	select BR2_PACKAGE_PYTHON_IMPORTLIB_METADATA # runtime

I don't see this option existing in Buildroot, and your patch 1/4 in
this series was adding the python-packaging package.

Am I missing something here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

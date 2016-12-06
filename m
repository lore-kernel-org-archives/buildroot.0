From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 17:24:08 +0100
Subject: [Buildroot] [PATCH] package/easydbus: new package
In-Reply-To: <20161206132739.27239-1-m.niestroj@grinn-global.com>
References: <20161206132739.27239-1-m.niestroj@grinn-global.com>
Message-ID: <20161206172408.6d120969@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 14:27:39 +0100, Marcin Niestroj wrote:

> diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
> new file mode 100644
> index 0000000..43abeae
> --- /dev/null
> +++ b/package/easydbus/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_EASYDBUS
> +	bool "easydbus"
> +	select BR2_PACKAGE_LIBGLIB2

LIBGLIB2 has Config.in dependencies, so you should replicate them here.

> +	help
> +	  Easy to use DBus library for Lua.
> +
> +	  https://github.com/mniestroj/easydbus

And add the corresponding Config.in comment here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

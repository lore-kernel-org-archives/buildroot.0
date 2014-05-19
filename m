From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 14:06:38 +0200
Subject: [Buildroot] [PATCH v3 1/3] isl: new package
In-Reply-To: <BLU436-SMTP204DD838D8182EFE104B7A8320@phx.gbl>
References: <1400500465-9142-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP204DD838D8182EFE104B7A8320@phx.gbl>
Message-ID: <20140519140638.6948849b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 11:54:23 +0000, Steve Thomas wrote:

> diff --git a/package/isl/Config.in b/package/isl/Config.in
> new file mode 100644
> index 0000000..bc2a3ef
> --- /dev/null
> +++ b/package/isl/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_ISL
> +	bool "isl"
> +	select BR2_PACKAGE_GMP
> +	help
> +	  Library for manipulating sets and relations of integer points bounded by linear constraints.
> +
> +	  http://freecode.com/projects/isl

This part is not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

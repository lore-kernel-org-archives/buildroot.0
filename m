From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 14:07:03 +0200
Subject: [Buildroot] [PATCH v3 2/3] cloog: new package
In-Reply-To: <BLU436-SMTP25605C9B636A28776C2EAA8320@phx.gbl>
References: <1400500465-9142-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP25605C9B636A28776C2EAA8320@phx.gbl>
Message-ID: <20140519140703.34ef8615@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 11:54:24 +0000, Steve Thomas wrote:

> diff --git a/package/cloog/Config.in b/package/cloog/Config.in
> new file mode 100644
> index 0000000..db99242
> --- /dev/null
> +++ b/package/cloog/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CLOOG
> +	bool "cloog"
> +    select BR2_PACKAGE_GMP
> +    select BR2_PACKAGE_ISL
> +	help
> +	  Chunky LOOp Generator - Library which generates loops for scanning Z-polyhedra.
> +
> +	  http://clooglib.org/

This part is not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:52:27 +0200
Subject: [Buildroot] [PATCH] libbson: new package
In-Reply-To: <20170410145915.22814-1-arnout@mind.be>
References: <20170410145915.22814-1-arnout@mind.be>
Message-ID: <20170412215227.5f65c07e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 16:59:15 +0200, Arnout Vandecappelle

>  package/Config.in            |  1 +
>  package/libbson/Config.in    |  6 ++++++
>  package/libbson/libbson.hash |  2 ++
>  package/libbson/libbson.mk   | 21 +++++++++++++++++++++

This lacked an updated to the DEVELOPERS file, so I've fixed this up
when applying.

> diff --git a/package/libbson/Config.in b/package/libbson/Config.in
> new file mode 100644
> index 0000000000..719271c732
> --- /dev/null
> +++ b/package/libbson/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBBSON
> +	bool "libbson"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  libbson is a library providing useful routines related to
> +	  building, parsing, and iterating BSON documents.

Thread dependency, but no Config.in comment? I've also fixed this up.

Applied with these two issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

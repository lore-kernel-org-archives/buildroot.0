From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:42:25 +0200
Subject: [Buildroot] [PATCH] php: fix bfin compile error
In-Reply-To: <20160930060702.GA30641@waldemar-brodkorb.de>
References: <20160930060702.GA30641@waldemar-brodkorb.de>
Message-ID: <20161007154225.25837cf9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Sep 2016 08:07:02 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/php/0008-fix-bfin-gcc-segfault.patch b/package/php/0008-fix-bfin-gcc-segfault.patch
> new file mode 100644
> index 0000000..7ff7ed6
> --- /dev/null
> +++ b/package/php/0008-fix-bfin-gcc-segfault.patch
> @@ -0,0 +1,19 @@
> +diff -Nur php-7.0.11.orig/Zend/zend_compile.c php-7.0.11/Zend/zend_compile.c
> +--- php-7.0.11.orig/Zend/zend_compile.c	2016-09-13 20:52:26.000000000 +0200
> ++++ php-7.0.11/Zend/zend_compile.c	2016-09-30 04:24:32.380877446 +0200

Also patches need a description + Signed-off-by line.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

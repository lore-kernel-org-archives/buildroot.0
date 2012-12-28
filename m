From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:48:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: new package
In-Reply-To: <10a2519ee66e733b1837c6b48c59a90887086be5.1356719913.git.yann.morin.1998@free.fr>
References: <cover.1356719913.git.yann.morin.1998@free.fr>
 <10a2519ee66e733b1837c6b48c59a90887086be5.1356719913.git.yann.morin.1998@free.fr>
Message-ID: <20121228204837.7ba7b56b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 28 Dec 2012 19:42:12 +0100, Yann E. MORIN wrote:

> @@ -0,0 +1,18 @@
> +#comment "tvheadend requires a toolchain with WCHAR and LARGEFILE support"
> +#	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE

Hum?


> diff --git a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
> new file mode 100644
> index 0000000..103f5ef
> --- /dev/null
> +++ b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
> @@ -0,0 +1,50 @@
> +diff -durN tvheadend-v3.3.orig//configure tvheadend-v3.3/configure
> +--- tvheadend-v3.3.orig//configure	2012-09-25 15:32:31.000000000 +0200
> ++++ tvheadend-v3.3/configure	2012-12-28 17:17:23.580253413 +0100

Patch lacks description.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

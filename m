From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 13:18:18 +0200
Subject: [Buildroot] [PATCH 07/36] package/celt051: new package
In-Reply-To: <1344815664-28138-7-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-7-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120817131818.74842ae3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 01:53:55 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> --- /dev/null
> +++ b/package/multimedia/celt051/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CELT051
> +	bool "celt051"
> +	select BR2_PACKAGE_LIBOGG
> +	help
> +	  The CELT ultra-low delay audio codec

Just curious, for what reason an audio codec is needed as a dependency
of a virtual machine thing? How does it fit in the stack?

> +# Although version newer than 0.5.1.3 exists, we're
> +# stuck with 0.5.1.3 for use by Spice (coming later)

Do you predict this version requirement to be kept for a long period of
time?

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

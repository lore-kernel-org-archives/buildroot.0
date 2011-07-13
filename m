From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 16:16:55 +0200
Subject: [Buildroot] [PATCH] Mini-XML: new package
In-Reply-To: <c0733fd8bffa6150cd9efeb202da470a2fdf0137.1310564424.git.baruch@tkos.co.il>
References: <c0733fd8bffa6150cd9efeb202da470a2fdf0137.1310564424.git.baruch@tkos.co.il>
Message-ID: <20110713161655.5607235e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jul 2011 16:40:46 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> The added patch is a workaround for cross build as follows:
> 
> 	* disable run of a test binary at build time
> 	* disable generation of documentation using the mxmldoc binary
> 	* remove now non-existent entries from the install target
> 	* disable strip when running install

Can you put these explanations in the header of the patch + add your
Signed-off-by line to this patch ?

Just curious, what is this library useful for compared to expat,
libxml2 or roxml ?

> +MXML_CONF_OPT = --enable-shared

This is not needed, it is passed automatically by Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:20:00 +0100
Subject: [Buildroot] [PATCH 4/5] package/imx-mkimage: bump to version
 rel_imx_4.19.35_1.1.0
In-Reply-To: <20200320163158.18341-5-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
 <20200320163158.18341-5-maeva.manuel@oss.nxp.com>
Message-ID: <20200321162000.47e552c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Mar 2020 17:31:57 +0100
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> -From 0677e6cff00506de56d11bfa230b6c366e74f6ed Mon Sep 17 00:00:00 2001
> +From 4870df3d70e94f9f0d6c06f610cea2d88cd6edb5 Mon Sep 17 00:00:00 2001
>  From: Erik Larsson <erik.larsson@combitech.se>
>  Date: Thu, 8 Mar 2018 19:04:37 +0100
> -Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
> +Subject: [PATCH 1/3] Add support for overriding BL32 and BL33 not only BL31

Please generate patches with "git format-patch -N" to have the 1/3, 2/3
and 3/3 numbering inside the patches.

I fixed that when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

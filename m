From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 May 2019 09:03:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: select individual
 libraries when selecting SELinux support.
In-Reply-To: <20190516155200.86689-1-aduskett@gmail.com>
References: <20190516155200.86689-1-aduskett@gmail.com>
Message-ID: <20190517090319.00ebb34e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 May 2019 11:52:00 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> From the help test of individual binaries:
> 
> With this option enabled, each applet is a separate binary, which is needed for
> proper operation with SELinux
> 
> As such, it only makes sense to select this option when SELinux support is
> selected as well.

The wording here is a bit unfortunate, as one could read this as if you
had added a "depends on BR2_PACKAGE_BUSYBOX_SELINUX" to
"BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES", so that "individual
binaries" can only be used with SELinux.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

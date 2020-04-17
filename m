From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:15:46 +0200
Subject: [Buildroot] [PATCH v4 1/8] package/libselinux: bump version to
 3.0
In-Reply-To: <20200415125921.57648-2-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
 <20200415125921.57648-2-matthew.weber@rockwellcollins.com>
Message-ID: <20200417221546.5901429e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after adjusting two minor nits.

On Wed, 15 Apr 2020 07:59:14 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream packages.

                      ^^^^ patches

> -ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  LIBSELINUX_DEPENDENCIES += python3 host-swig
>  LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)

This variable was no longer used anywhere, so I dropped it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

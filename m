From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Oct 2017 16:11:28 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
Message-ID: <20171013161128.37827061@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 21:35:56 -0500, Matt Weber wrote:

> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python3
> +else
> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python
> +endif

Gaah, adding host-python as a mandatory dependency of host-uboot-tools
is a big change. Any way around that ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

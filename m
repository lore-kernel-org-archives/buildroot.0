From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 21:28:10 +0200
Subject: [Buildroot] [PATCH v2 1/2] mfgtools: new package
In-Reply-To: <20161026160803.30262-2-gary.bisson@boundarydevices.com>
References: <20161026160803.30262-1-gary.bisson@boundarydevices.com>
 <20161026160803.30262-2-gary.bisson@boundarydevices.com>
Message-ID: <20161026212810.34c61185@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 18:08:02 +0200, Gary Bisson wrote:
> This package contains the Freescale manufacturing tool.
> It is designed to program firmware to i.MX boards during production.
> The communication is done over USB using the Freescale UTP protocol.
> 
> The project is maintained on NXPMicro Github repository:
> https://github.com/NXPmicro/mfgtools
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I've applied, with the following changes:

    [Thomas:
     - remove dependency on host-cmake, this is handled by the
       host-cmake-package infrastructure
     - add quotes around $(HOSTCXX)
     - add CPOL.htm to <pkg>_LICENSE_FILES.
     - tweaks to the readme.txt file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

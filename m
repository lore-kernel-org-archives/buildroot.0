From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 13:31:23 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <20160427102152.GL28464@e106497-lin.cambridge.arm.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <20160426220522.5897a74f@free-electrons.com>
 <20160427102152.GL28464@e106497-lin.cambridge.arm.com>
Message-ID: <20160427133123.7df13c03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 11:21:52 +0100, Liviu.Dudau at arm.com wrote:

> > Same comment about "into the fip package".
> > 
> > > +specify SCP_BL2=<binary_path> in BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES.
> > 
> > Just for info, what is this SCP Firmware ?
> 
> Juno has a System Control Processor that does SoC clock and power management.

OK, thanks for the explanation!

So perhaps just for the sake of clarity, use "System Control Processor"
in the readme.txt instead of just SCP.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

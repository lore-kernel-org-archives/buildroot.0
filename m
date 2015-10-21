From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 17:14:02 +0200
Subject: [Buildroot] [PATCH 1/1] configs/xilfpga: Add xilfpga defconfig
In-Reply-To: <1445439476-32911-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1445439476-32911-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Message-ID: <20151021171402.5d9aa7d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zubair,

On Wed, 21 Oct 2015 15:57:56 +0100, Zubair Lutfullah Kakakhel wrote:
> Under the IMG University Program 'MIPSfpga', RTL verilog code for a MIPS
> m14kEC core is released under an academic license.
> 
> The core is used to make a soft-SOC which can run the Linux kernel +
> buildroot.

Cool! :-)

> 
> This patch adds a defconfig for it and a readme file.
> 
> The config generates a simple mips32r2 rootfs using uClibc.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> ---
> p.s.
> 
> The kernel patches for MIPSfpga will hopefully be upstreamed by 4.4.
> 
> Once that is done, I'll look into adding the stuff to enable buildroot
> to compile the kernel as well.

A defconfig which doesn't build a kernel nor a bootloader is pretty
useless IMO.

Isn't the code to build this kernel available on some Git repository,
even if it's not upstream yet ? If so, then it would be better to have
a defconfig that points to this Git repository (actually, many of our
defconfigs point to non-upstream kernel source code).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

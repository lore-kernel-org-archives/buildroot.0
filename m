From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:31:22 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale SABRE Auto board
 support
In-Reply-To: <1396629422-24577-1-git-send-email-vincent.stehle@freescale.com>
References: <1396629422-24577-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20140716223122.36854547@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Fri, 4 Apr 2014 18:37:02 +0200, Vincent Stehl? wrote:
> SABRE Board for Automotive Infotainment (SABRE Auto, a.k.a. SABRE-AI) is
> Freescale's evaluation board based on the i.MX 6 ARM Cortex-A9 applications
> processor.
> 
> This defconfig is an adaptation of freescale_imx6sabresd_defconfig for SABRE
> Auto, and is based on Freescale "official" git repo on git.freescale.com and SW
> release 3.0.35_4.1.0.

Thanks. However, we have migrated all i.MX6 platforms to use the 3.10
kernel from Freescale, to be in sync with the GPU and VPU packages.
Could you update your defconfig to use 3.10 as well, and resend?

In the mean time, I'll mark your patch
http://patchwork.ozlabs.org/patch/337045/ as "Changes Requested" in
patchwork.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

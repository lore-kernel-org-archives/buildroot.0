From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:42:50 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-common.in: update
 definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
In-Reply-To: <1496777704.3962.5.camel@embedded.rocks>
References: <20170606140850.5823-1-joerg.krause@embedded.rocks>
 <20170606173222.537500c6@free-electrons.com>
 <1496774645.3962.1.camel@embedded.rocks>
 <20170606212314.069892f2@free-electrons.com>
 <1496777704.3962.5.camel@embedded.rocks>
Message-ID: <20170606214250.08a6e547@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 06 Jun 2017 21:35:04 +0200, J?rg Krause wrote:

> Sorry, I totally got you wrong. So, what you mean is:
> 
> 
> """
> config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 	bool
> 	default y if BR2_nios2
> 	default y if BR2_ARM_CPU_ARMV4
> 	default y if BR2_ARM_CPU_ARMV5
> 	default y if BR2_sparc_v8
> 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> """
> 
> Right?

Yes, exactly!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

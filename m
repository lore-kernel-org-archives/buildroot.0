From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:00:13 +0200
Subject: [Buildroot] [PATCH 2/5] arch/mips: add option for toolchains
 supporting -mfpxx
In-Reply-To: <20170721170635.41202-2-Vincent.Riera@imgtec.com>
References: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
 <20170721170635.41202-2-Vincent.Riera@imgtec.com>
Message-ID: <20170721230013.0f8f9111@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 18:06:32 +0100, Vicente Olivert Riera wrote:

>  config BR2_MIPS_FP32_MODE_XX
> +	depends on BR2_TOOLCHAIN_HAS_MFPXX_OPTION
>  	bool "xx"

The "depends on" line should have been after the "bool" line, so I
fixed that and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

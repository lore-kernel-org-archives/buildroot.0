From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 23:28:51 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/ext-toolchain-updates
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201201312328.51860.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 January 2012 18:36:40 Thomas Petazzoni wrote:
> Thomas Petazzoni (16):
>       Add x86_64 variants to BR2_GCC_TARGET_ARCH
>       Add the Atom processor in the list of supported x86/x86_64 processors
>       Improve external toolchain logic to support IA32 Sourcery CodeBench toolchain
>       Support multilib variants in sub-subdirectories
>       Expand external toolchain wrapper to custom flags
>       external-toolchain: remove 2009q1 ARM Sourcery toolchain
>       external-toolchain: add Sourcery CodeBench ARM 2011.09
>       external-toolchain: bump MIPS 2011.03 from -93 to -110
>       external-toolchain: add Sourcery CodeBench PowerPC 2011.03
>       external-toolchain: add Sourcery CodeBench x86/x86_64 2011.09
>       external-toolchain: Blackfin.uclinux.org 2011R1-RC4
>       external-toolchain: details on selecting the multilib variants
>       external-toolchain: run checks even on extracted toolchains
>       external-toolchain: adjust check for uClibc static toolchains

 Up to patch 14/16:
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 on i386 and x86_64 with a random set of packages.

>       external-toolchain: fix description of PowerPC 2010.09 from Mentor Graphics
>       external-toolchain: add support for Linaro 2012.01
 But those two shouldn't affect x86 architectures.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

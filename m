From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:33:32 +0100
Subject: [Buildroot] [PATCH 1/3] arch/Config.in.arm: only enable
 BR2_ARM_CPU_HAS_ARM for ARMv8 in 32bit mode
In-Reply-To: <20161207092522.16222-1-peter@korsgaard.com>
References: <20161207092522.16222-1-peter@korsgaard.com>
Message-ID: <20161208223332.47bacde9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Dec 2016 10:25:20 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/5e6/5e67cc067a06f7364cde1a8393ea72608fe7fef1/
> 
> A number of packages use BR2_ARM_CPU_HAS_ARM to know if the target handles
> classic A32 instructions, which is only true for ARMv8 cores when they are
> running in 32bit mode.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  arch/Config.in.arm | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

All three applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

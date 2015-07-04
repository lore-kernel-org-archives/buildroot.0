From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:56:14 +0200
Subject: [Buildroot] [v4 1/4] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <1435830207-16664-1-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
Message-ID: <20150704145614.4a4626ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Thu,  2 Jul 2015 10:43:24 +0100, Martin Bark wrote:
> The version of the V8 JavaScript engine used by node.js v0.12.5 requires
> at least an ARMv6 architecture with VFPv2.  For this reason v0.10.39
> remains the default for ARMv5 targets, all other targets now default to
> v0.12.5.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v3 -> v4
>  - Added back depends on !BR2_ARM_CPU_ARMV5 that was removed by mistake
>    (Suggested by Yann E. MORIN)

All four patches applied, thanks!

For reference, I've tested by adding the "learnyournode" module, which
thanks to your patch 2/4 now installs the command in /usr/bin, which
allows to run it transparently.

Thanks to Yann for the review/comments!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

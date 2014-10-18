From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 18:35:34 +0200
Subject: [Buildroot] [PATCH] mx53loco_defconfig: refresh
In-Reply-To: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
References: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20141018183534.0fa51566@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Fri, 17 Oct 2014 17:05:08 +0200, Vincent Stehl? wrote:
> Force gcc to version 4.5, as versions 4.7 and 4.8 break the boot.
> 
> Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).

This is quite worrying. Gcc 4.5 is very old now, and we would like to
get rid of it in Buildroot rather than adding more defconfig that use
it.

Is there some hope to get a fix in a more recent gcc such as 4.9.x ?
Has the specific gcc bug been identified and reported ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

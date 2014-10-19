From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:39:52 +0200
Subject: [Buildroot] [PATCH] mx53loco_defconfig: refresh
In-Reply-To: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
References: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20141019163952.19c7c080@free-electrons.com>
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
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  configs/mx53loco_defconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Can you update the patch according to Eric Benard's comment?

In the mean time, I'll mark your patch as "Changes Requested" in our
patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

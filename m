From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:40:23 +0200
Subject: [Buildroot] [PATCH] config/raspberrypi3: use correct CPU
In-Reply-To: <20170501091104.3183-1-yann.morin.1998@free.fr>
References: <20170501091104.3183-1-yann.morin.1998@free.fr>
Message-ID: <20170502224023.450b144c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 11:11:04 +0200, Yann E. MORIN wrote:
> We so far were using a Cortex-A7 as the CPU for the rpi3, as this was
> the closest we had available, in 32-bit mode, to the real CPU used in
> the rpi3.
> 
> But now we can also use the Cortex-A53 in 32-bit mode, so we use that,
> which makes for an optimised build (A53 has an improved instruction set,
> as compared to the A7).
> 
> Also drop the DTB overlay option, it defaults to 'y'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Martin Bark <martin@barkynet.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> 
> ---
> Martin, Peter, you are the last ones to have touched this defconfig, and
> I lack a rpi3. Would you be kind enough to test this on your hw, please?
> ---
>  configs/raspberrypi3_defconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

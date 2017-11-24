From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:32:56 +0100
Subject: [Buildroot] [pull request] arch/arm: add some new armv8a cores
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
 <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <20171124233256.3c65efd2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 15:17:44 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (9):
>       arch/arm: re-order cores choice
>       arch/arm: simplify hiding non 64-bit cores
>       arch/arm: armv8 is really armv8a

Those patches applied to next.

>       arch/arm: do not allow soft-float for armv8a

This one not applied, see my reply to it. I've kept it as "New" in
patchwork for now.

>       arch/arm: add cortex-A32
>       arch/arm: add some armv8a cortex variants
>       arch/arm: add some non-cortex armv8a cores
>       arch/arm: add armv8.1a cores

I've applied those four patches to next as well. As I replied to one of
them, I'm not super convinced exhaustively adding all cores is really
useful, but since you did it, and build tested all of them, I applied
the patches anyway.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

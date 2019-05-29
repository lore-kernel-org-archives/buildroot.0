From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 09:23:07 +0200
Subject: [Buildroot] [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <1559114328-23357-4-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org>
Message-ID: <20190529092307.6c78996b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 15:18:41 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> This is only for abiv2 and abiv1 don't support FPU.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
defined for all cases, which seems to contradict your commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

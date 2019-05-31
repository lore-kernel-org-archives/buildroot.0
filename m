From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:04:24 +0200
Subject: [Buildroot] [PATCH V4 02/11] arch/csky: Change DSP to VDSP for
 -mcpu
In-Reply-To: <1559284748-32011-3-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
 <1559284748-32011-3-git-send-email-guoren@kernel.org>
Message-ID: <20190531230424.4f3a6e20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 14:38:59 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> DSP extention is no longer used for C-SKY gcc and use VDSP instead of
> DSP.
> 
> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be supported by abiv2 (ck807, ck810, ck860).
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've split this patch into two: one removing the DSP option, one adding
the VDSP option. Also, I've added the appropriate Config.in.legacy
option to replace BR2_CSKY_DSP.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

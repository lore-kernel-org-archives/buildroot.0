From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 21:58:40 +0200
Subject: [Buildroot] [PATCH] arch: drop now useless support for FDPIC
In-Reply-To: <20180521161706.3151-1-yann.morin.1998@free.fr>
References: <20180521161706.3151-1-yann.morin.1998@free.fr>
Message-ID: <20180521215840.3ca959f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 18:17:06 +0200, Yann E. MORIN wrote:
> Now that we dropped support for blackfin, we no longer have any
> architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
> is never selected, so we can't select BR2_BINFMT_FDPIC.
> 
> Drop all of that now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

When I dropped Blackfin support, I wondered about dropping FDPIC
support. But I know people are working on FDPIC support on ARM, so I
wasn't sure it was useful to drop it now, and re-add it later on.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

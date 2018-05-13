From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:10:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] toolchain/buildroot: Fix symbol for
 uClibc
In-Reply-To: <20180509163323.30172-1-petr.vorel@gmail.com>
References: <20180509163323.30172-1-petr.vorel@gmail.com>
Message-ID: <20180513221009.72c31b8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 18:33:22 +0200, Petr Vorel wrote:
> Symbol BR2_TOOLCHAIN_UCLIBC doesn't exist, it was meant to be
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC.
> 
> Fixes: 493b1177b9 toolchain/buildroot: default to uClibc
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:33:45 +0100
Subject: [Buildroot] [PATCH] configs/kb9202_defconfig: remove defconfig
In-Reply-To: <1478353554-29400-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478353554-29400-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161105233345.737796c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 14:45:54 +0100, Thomas Petazzoni wrote:
> This configuration for the KwikByte KB9202 was added back in July 2008
> (commit e27fef51834042a1b108e04927a2a91742a54327), and was never
> updated since then. It still uses a 2.6.38 kernel, with the out of
> tree patches from the former AT91 kernel maintainer. The board has
> been discontinued according to its page at
> http://www.kwikbyte.com/KB9202.html.
> 
> This defconfig no longer builds since the switch to gcc 5.x as the
> default. Therefore, it's time to get rid of this defconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  configs/kb9202_defconfig | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 configs/kb9202_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

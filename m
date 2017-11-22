From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:17:03 +0100
Subject: [Buildroot] [PATCH] gptfdisk: bump to version 1.0.3
In-Reply-To: <20171117002902.10084-1-tpiepho@impinj.com>
References: <20171117002902.10084-1-tpiepho@impinj.com>
Message-ID: <20171122221703.08dceadc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 16:29:02 -0800, Trent Piepho wrote:
> This version has a new command line argument to sgdisk, -j, that lets one
> change the starting address of where the GPT partition table entries are
> stored.
> 
> The iMX SoC ROM loader, and perhaps others, expects the bootloader to start
> at sector 2.  Using this option with gptfdisk lets the table entries move
> to make space for the bootloader image.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/gptfdisk/gptfdisk.hash | 8 ++++----
>  package/gptfdisk/gptfdisk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

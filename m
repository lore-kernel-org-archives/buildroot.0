From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:35:00 +0200
Subject: [Buildroot] [PATCH] board/atmel: use correct sam-ba binary in
 flasher.sh script
In-Reply-To: <1522964081-1235-1-git-send-email-joshua.henderson@microchip.com>
References: <1522964081-1235-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180406213500.7c47e057@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 14:34:41 -0700, Joshua Henderson wrote:
> Instead of using the install of sam-ba under host/opt directly, use the symlink
> created in host/bin.  The side effect of doing this instead allows the correct
> sam-ba binary to be used based on the host arch being 32 bit or 64 bit.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  board/atmel/flasher.sh | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

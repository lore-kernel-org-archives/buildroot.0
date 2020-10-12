From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:33:48 +0200
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump U-Boot version
In-Reply-To: <20201011153251.660778-1-francois.perrad@gadz.org>
References: <20201011153251.660778-1-francois.perrad@gadz.org>
Message-ID: <20201012223348.3afc3a86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Oct 2020 17:32:51 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> since 2020.04 version, the enumeration of MMC has changed,
> so the boot script must be updated
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/solidrun/mx6cubox/boot.scr.txt | 6 +++---
>  configs/mx6cubox_defconfig           | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. Do not hesitate to send a follow-up patch to
bump to U-Boot 2020.10 once it works for you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:48:50 +0200
Subject: [Buildroot] [PATCH v2 19/37] */Config.in*: remove consecutive
 empty lines
In-Reply-To: <20180401050850.5701-20-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-20-ricardo.martincoski@gmail.com>
Message-ID: <20180401084850.5ba20d7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:32 -0300, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  Config.in                      | 1 -
>  Config.in.legacy               | 1 -
>  arch/Config.in.mips            | 1 -
>  boot/barebox/barebox/Config.in | 1 -
>  boot/syslinux/Config.in        | 1 -
>  fs/jffs2/Config.in             | 1 -
>  6 files changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

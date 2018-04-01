From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:53:27 +0200
Subject: [Buildroot] [PATCH v2 29/37] fs/*/Config.in: re-wrap help text
In-Reply-To: <20180401050850.5701-30-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-30-ricardo.martincoski@gmail.com>
Message-ID: <20180401085327.4d4262a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:42 -0300, Ricardo Martincoski wrote:
> ... to follow the convention <tab><2 spaces><62 chars>.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  fs/cpio/Config.in      |  6 +++---
>  fs/ext2/Config.in      | 22 ++++++++++++----------
>  fs/initramfs/Config.in |  3 ++-
>  fs/jffs2/Config.in     | 16 +++++++++-------
>  fs/ubi/Config.in       | 11 ++++++-----
>  5 files changed, 32 insertions(+), 26 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

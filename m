From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:42:22 +0200
Subject: [Buildroot] [PATCH v2 07/37] fs/*/*.mk: fix code style
In-Reply-To: <20180401050850.5701-8-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-8-ricardo.martincoski@gmail.com>
Message-ID: <20180401084222.78e16998@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:20 -0300, Ricardo Martincoski wrote:
> The header of the initramfs.mk file fits in one line, so rearrange it.
> Remove consecutive empty line.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  fs/initramfs/initramfs.mk | 3 +--
>  fs/iso9660/iso9660.mk     | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

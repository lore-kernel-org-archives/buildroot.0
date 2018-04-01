From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:42:17 +0200
Subject: [Buildroot] [PATCH v2 06/37] fs/ubi: use namespace for internal
 variable
In-Reply-To: <20180401050850.5701-7-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-7-ricardo.martincoski@gmail.com>
Message-ID: <20180401084217.3c5a8e4f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:19 -0300, Ricardo Martincoski wrote:
> UBINIZE_CONFIG_FILE_PATH is only used inside this file, so rename it to
> start with UBI_, following the namespace convention already used by
> common packages.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  fs/ubi/ubi.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

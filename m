From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:12:36 +0200
Subject: [Buildroot] [PATCH v2 17/37] check-package: enable for
 Config.in* in base dir
In-Reply-To: <20180401050850.5701-18-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-18-ricardo.martincoski@gmail.com>
Message-ID: <20180401091236.6260dc92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:30 -0300, Ricardo Martincoski wrote:
> These files can benefit from this script to prevent common mistakes when
> submitting patches.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - rebase after toolchain-common.in was merged to Config.in
> ---
>  utils/check-package | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

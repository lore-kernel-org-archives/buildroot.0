From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:46:28 +0200
Subject: [Buildroot] [PATCH v2 13/37] toolchain: merge
 toolchain-common.in to Config.in
In-Reply-To: <20180401050850.5701-14-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-14-ricardo.martincoski@gmail.com>
Message-ID: <20180401084628.1ca74b72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:26 -0300, Ricardo Martincoski wrote:
> toolchain-common.in is a Config.in file with an uncommon name.
> It is just included by toolchain/Config.in, and toolchain/Config.in is
> not that long, so instead of renaming the file, merge it to
> toolchain/Config.in.
> 
> Move the raw contents from the file to the exact location it is
> currently included in order to not change the order in the menu.
> 
> Update the references in the manual as well.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>   - new patch  (suggested by Thomas Petazzoni);
> ---
>  docs/manual/adding-packages-directory.txt |   4 +-
>  toolchain/Config.in                       | 471 +++++++++++++++++++++++++++++-
>  toolchain/toolchain-common.in             | 469 -----------------------------
>  3 files changed, 472 insertions(+), 472 deletions(-)
>  delete mode 100644 toolchain/toolchain-common.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:30:29 +0200
Subject: [Buildroot] [PATCH] configs/lafrite_defconfig: bump kernel to
 5.8.10
In-Reply-To: <20200917183519.31494-1-peter@korsgaard.com>
References: <20200917183519.31494-1-peter@korsgaard.com>
Message-ID: <20200917213029.61660c6d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Sep 2020 20:35:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Brings a number of fixes and audio support.  The aarch64 defconfig has
> grown, so bump the ext4 size to make it fit.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/lafrite_defconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

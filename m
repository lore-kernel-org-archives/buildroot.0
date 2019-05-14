From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:20:16 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2019.03-rc1
In-Reply-To: <20190512181119.17831-1-Evgeniy.Didin@synopsys.com>
References: <20190512181119.17831-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190514192016.4aafdcba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 21:11:19 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> This commit bumps ARC toolchain to arc-2019.03-rc1.
> We want to test how new toolchain-rc1 builds packages,
> so we can make fixes before release of toolcain.
> 
> ARC GNU tools of version arc-2019.03-rc1 bring some quite
> significant changes like:
> * Binutils v2.32.51.20190308 with additional ARC patches 
> * GCC 8.3.1 with additional ARC patches
> * glibc 2.29 with additional ARC patches
> 
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Unfortunately we are late to add this patch before rc1.
> Could this patch be applied to master branch?

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

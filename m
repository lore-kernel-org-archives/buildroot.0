From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Thu, 15 Nov 2018 03:51:49 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] toolchain: Bump ARC tools
 to arc-2018.09-rc1
In-Reply-To: <20181108113207.40589-1-Evgeniy.Didin@synopsys.com>
References: <20181108113207.40589-1-Evgeniy.Didin@synopsys.com>
Message-ID: <a4c4c371bc8fbefc5e3e1a466ed80dfd334a4b9a.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter, Arnout!

On Thu, 2018-11-08 at 14:32 +0300, Evgeniy Didin wrote:
> This commit bumps ARC toolchain to arc-2018.09-rc1.
> We want to test how new toolchain-rc1 builds packages,
> so we can make fixes before release of toolcain.
> 
> ARC GNU tools of version arc-2018.09-rc1 bring some quite significant changes like:
> * Binutils v2.31.1 with additional ARC patches
> * GCC 8.2.1 with additional ARC patches
> * glibc 2.28 with additional ARC patches
> 
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

Any chance arc-2018.09 tools to be accepted in v2018.11 BR release?

In the meantime we've got RC2 cut just yesterday with a couple of more
critical fixes so it might make sense to bump right to arc-2018.09-rc2
instead but still it might be applied on top of this one so pls let us
know what would you prefer.

-Alexey

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 10:00:04 +0200
Subject: [Buildroot] [PATCH] sunxi-tools: bump to latest git revision
In-Reply-To: <20161004194529.26868-1-peter@korsgaard.com>
References: <20161004194529.26868-1-peter@korsgaard.com>
Message-ID: <20161005100004.2fee14a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Oct 2016 21:45:29 +0200, Peter Korsgaard wrote:
> Major changes since v1.3:
> - A64/A80 support
> - H3 fel speedup
> - Fel readl/writel/sid/reset64 commands
> - Fel progress bar support
> - Nand-image-builder tool
> - Linaro toolchain compatibility workaround
> - Portability fixes
> 
> The build system has been reworked somewhat and extra compiler flags now
> have to be passed in EXTRA_CFLAGS instead of CFLAGS, so we cannot use
> {TARGET,HOST}_CONFIGURE_OPTS.
> Instead explicitly pass the needed variables (CC and LDFLAGS).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/sunxi-tools/sunxi-tools.hash |  2 +-
>  package/sunxi-tools/sunxi-tools.mk   | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

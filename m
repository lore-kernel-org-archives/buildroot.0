From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:59:07 +0200
Subject: [Buildroot] [PATCH] lxc: fix offsetof() related musl build issue
In-Reply-To: <20180420103155.4203-1-thomas.petazzoni@bootlin.com>
References: <20180420103155.4203-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180421145907.761f0f65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 12:31:55 +0200, Thomas Petazzoni wrote:
> This commit adds a patch that fixes a build issue with musl due to the
> fact that offsetof() is used without including <stddef.h>.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3c6e34cbcd43aba4dd2b18687bd89fc369c9dab7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ools-lxc_monitor-include-missing-stddef.h.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

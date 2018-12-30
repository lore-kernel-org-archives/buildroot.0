From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:57:41 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
In-Reply-To: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
References: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181230165741.4ff444d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 16:07:40 +0100, Thomas Petazzoni wrote:
> When libsseccomp support is enabled, docker-containerd uses pkg-config
> to find libsseccomp, so we must depend on host-pkconf.
> 
> Fixes the following build issue, detected with per-package directory
> support:
> 
> pkg-config: exec: "pkg-config": executable file not found in $PATH
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/docker-containerd/docker-containerd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

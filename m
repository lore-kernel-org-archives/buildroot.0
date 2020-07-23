From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:35:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/setools: remove C++ dependency
 on comment
In-Reply-To: <20200722074430.2150934-1-antoine.tenart@bootlin.com>
References: <20200722074430.2150934-1-antoine.tenart@bootlin.com>
Message-ID: <20200723163507.16f1550d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 09:44:29 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> Bump to 4.1.1 (commit 96d3d017963b) removed setools' dependency on
> BR2_INSTALL_LIBSTDCPP, but the corresponding inverse dependency on one
> of its Kconfig comment was not removed. This led to have the package
> being available while a Kconfig comment on non-matched dependencies is
> shown. Fix this by removing the dependency on !BR2_INSTALL_LIBSTDCPP on
> the Kconfig comment.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  package/setools/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

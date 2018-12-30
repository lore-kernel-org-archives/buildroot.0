From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:57:52 +0100
Subject: [Buildroot] [PATCH] package/terminology: convert to the
 meson-package infrastructure
In-Reply-To: <20181228150747.29965-1-thomas.petazzoni@bootlin.com>
References: <20181228150747.29965-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181230165752.56d59d80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 16:07:47 +0100, Thomas Petazzoni wrote:
> This conversion reduces the complexity of the .mk file, but also
> allows to prepare terminology for per-package meson
> cross-compilation.conf, where the cross-compilation.conf file will not
> be located in $(HOST_DIR)/etc/meson/cross-compilation.conf.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/terminology/terminology.mk | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

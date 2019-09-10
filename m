From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:32:56 +0200
Subject: [Buildroot] [PATCH] package/socketcand: bump version
In-Reply-To: <20190910093026.2662-1-yegorslists@googlemail.com>
References: <20190910093026.2662-1-yegorslists@googlemail.com>
Message-ID: <20190910193256.007b90cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Sep 2019 11:30:26 +0200
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Change download location as the project is now part of the linux-can
> organization.
> 
> Also remove an upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 54 -------------------
>  package/socketcand/socketcand.hash            |  2 +-
>  package/socketcand/socketcand.mk              |  4 +-
>  3 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/socketcand/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

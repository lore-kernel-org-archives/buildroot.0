From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 17:07:21 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump version to 1.29.3
In-Reply-To: <20180922140641.9937-1-ferdinand@ombud.nl>
References: <20180922140641.9937-1-ferdinand@ombud.nl>
Message-ID: <20180923170721.6b56df4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 16:06:41 +0200, Ferdinand van Aartsen wrote:
> Remove 0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
> It caused a segfault which was fixed in this release.
> 
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
> ---
>  ...ove-unnecessary-variable-in-xmalloc_.patch | 39 -------------------
>  package/busybox/busybox.hash                  |  4 +-
>  package/busybox/busybox.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

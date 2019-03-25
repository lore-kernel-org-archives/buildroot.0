From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:25:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/odhcp6c: bump to version
 d2e247d8d87ecf8c60fcf0acdad05667bd379521
In-Reply-To: <20190325175933.16531-1-fontaine.fabrice@gmail.com>
References: <20190325175933.16531-1-fontaine.fabrice@gmail.com>
Message-ID: <20190325192549.7ead2d3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Mar 2019 18:59:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-dhcpv6-fix-strncpy-bounds.patch      | 28 -------------------
>  package/odhcp6c/odhcp6c.hash                  |  3 +-
>  package/odhcp6c/odhcp6c.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100644 package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

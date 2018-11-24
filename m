From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 12:59:08 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build with newer freerdp
In-Reply-To: <20181124104107.29147-1-yann.morin.1998@free.fr>
References: <20181124104107.29147-1-yann.morin.1998@free.fr>
Message-ID: <20181124125908.18a914ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 11:41:07 +0100, Yann E. MORIN wrote:
> Commit a63aad66d3 (package/freerdp: bump version to 2.0.0-rc2)
> introduced a FreeRDP that has a different API, and this breaks
> weston.
> 
> Backport a patch from upstream weston to fix the issue.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/c0b4f7c4cee2c11715ecc2ef0cfb42f80dbf81b0/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...tor-fix-compilation-against-FreeRDP-2.0.0.patch | 181 +++++++++++++++++++++
>  package/weston/weston.mk                           |   3 +
>  2 files changed, 184 insertions(+)
>  create mode 100644 package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

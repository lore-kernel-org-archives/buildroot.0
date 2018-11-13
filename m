From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:02:35 +0100
Subject: [Buildroot] [PATCH next 1/2] libnftnl: bump to version 1.1.2
In-Reply-To: <7a1b057bfd52cb51158a55a39e01fc98b482740b.1542139209.git.baruch@tkos.co.il>
References: <7a1b057bfd52cb51158a55a39e01fc98b482740b.1542139209.git.baruch@tkos.co.il>
Message-ID: <20181113220235.22c2ec2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 22:00:08 +0200, Baruch Siach wrote:
> Update patch 0001.
> 
> Switch to https for download site to save a redirect.
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...libnftnl_xfree-to-avoid-symbol-namin.patch | 297 ++++++++++++------
>  package/libnftnl/libnftnl.hash                |   5 +-
>  package/libnftnl/libnftnl.mk                  |   4 +-
>  3 files changed, 212 insertions(+), 94 deletions(-)

Both applied to next, thanks! For libnftl, it would be nice to try to
upstream this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

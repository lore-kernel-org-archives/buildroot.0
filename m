From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:01:39 +0200
Subject: [Buildroot] [PATCH] s6-linux-utils: fix build with glibc 2.28
In-Reply-To: <131325e8288cf4027e581c26c978d7ce350ace8b.1537274175.git.baruch@tkos.co.il>
References: <131325e8288cf4027e581c26c978d7ce350ace8b.1537274175.git.baruch@tkos.co.il>
Message-ID: <20180918210139.6d0fdc80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 15:36:15 +0300, Baruch Siach wrote:
> Add upstream patch that adds needed header for the major/minor macros.
> 
> Fixes:
> http://autobuild.buildroot.net/results/974/9742dfabd9b244e1381983dd05edd3e65504f0fe/
> 
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...s-sysmacros.h-because-glibc-is-glibc.patch | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

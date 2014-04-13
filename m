From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:56:22 +0200
Subject: [Buildroot] [PATCH] mtd: fix build against uClibc
In-Reply-To: <9a5ad873a2de4ff87857be24d5d1a4b4e1383cec.1397392890.git.baruch@tkos.co.il>
References: <9a5ad873a2de4ff87857be24d5d1a4b4e1383cec.1397392890.git.baruch@tkos.co.il>
Message-ID: <20140413215622.2ea33612@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 13 Apr 2014 15:41:30 +0300, Baruch Siach wrote:
> Add a rpmatch() implementation when uClibc is missing one.
> 
> Fixes:
> http://autobuild.buildroot.net/results/171/17187c3c9ba2b9df2bb6ac103e9a54706f07c28b/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...common.h-fix-build-against-current-uClibc.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

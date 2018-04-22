From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:34:50 +0200
Subject: [Buildroot] [PATCH] strace: fix build for m68k
In-Reply-To: <6997829c47902abe2046f39a17ac53972601ef33.1524423074.git.baruch@tkos.co.il>
References: <6997829c47902abe2046f39a17ac53972601ef33.1524423074.git.baruch@tkos.co.il>
Message-ID: <20180422233450.33258ce2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 21:51:14 +0300, Baruch Siach wrote:
> Add upstream patch fixing build for m68k target.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bef/befdcb3f87c0490cd623520403b9467ec7359950/
> http://autobuild.buildroot.net/results/ddb/ddb7616991468bc45d85aa1b56bec2cb5eb897c4/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/0001-m68k-fix-build.patch | 97 ++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 package/strace/0001-m68k-fix-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

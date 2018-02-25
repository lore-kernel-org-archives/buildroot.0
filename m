From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:14:50 +0100
Subject: [Buildroot] [PATCH master] mbedtls: fix API compatibility
In-Reply-To: <df116322c8e36b017055d6be9f5af3c1631fdf89.1519505340.git.baruch@tkos.co.il>
References: <df116322c8e36b017055d6be9f5af3c1631fdf89.1519505340.git.baruch@tkos.co.il>
Message-ID: <20180225231450.19463603@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Feb 2018 22:49:00 +0200, Baruch Siach wrote:
> Add upstream patch fixing API compatibility with previous releases.
> 
> Fixes (hiawatha):
> http://autobuild.buildroot.net/results/ce6/ce6b4a50e6aafd06f82eaae688dd8720b982e9c2/
> http://autobuild.buildroot.net/results/cde/cdec7ae3565d5b76a9bc50156c6244b44197534e/
> http://autobuild.buildroot.net/results/9c1/9c1aec09c03f60bee9dc134da5a29e2671fc3b5e/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-dhm-Fix-typo-in-RFC-5114-constants.patch  | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

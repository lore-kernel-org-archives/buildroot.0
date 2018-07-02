From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:10:42 +0200
Subject: [Buildroot] [PATCH] stress-ng: fix build with kernel headers
 v3.9
In-Reply-To: <0f6a3acdfa31f852295e2f3be3701fdafc0f7256.1530555337.git.baruch@tkos.co.il>
References: <0f6a3acdfa31f852295e2f3be3701fdafc0f7256.1530555337.git.baruch@tkos.co.il>
Message-ID: <20180702221042.7a6e2c62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jul 2018 21:15:37 +0300, Baruch Siach wrote:
> Add a patch correcting the kernel headers version test macro.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cbf/cbfb80117840bddd5712bcda3caeaaff61745b0b/
> http://autobuild.buildroot.net/results/649/64941ac5b7dcd9c100bdc47cdfe73cce5f23c3d8/
> http://autobuild.buildroot.net/results/741/741f5881d3cb745d1003ede3f762c20eb72de0b5/
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...link-proc-fix-build-with-kernel-v3.9.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

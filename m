From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:52:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/aircrack-ng: powerpc support
 optional ALTIVEC
In-Reply-To: <1535411668-36286-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535411668-36286-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180828235240.39d7dc05@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 18:14:27 -0500, Matt Weber wrote:
> This patch adds support for the powerpc arch to conditionally
> check if an arch provies altivec accelerator support, similar
> to other SIMD on ARM/x86.
> 
> Upstream issue: aircrack-ng/aircrack-ng#1941
> 
> Fixes
> http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075
> 
> Tested against both a e6500 with Altivec and a e500 target.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...1-autotools-Fix-optional-SIMD-on-PPC-arch.patch | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:53:27 +0200
Subject: [Buildroot] [PATCH v2] package/aircrack-ng: powerpc arch
 requires altivec
In-Reply-To: <20180814133832.5658-1-matthew.weber@rockwellcollins.com>
References: <20180814133832.5658-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180814155327.24b7f14a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 08:38:32 -0500, Matt Weber wrote:
> The powerpc support in this package currently requires an arch with
> altivec accelerator support. This is a bug and the the powerpc arch
> should have a non-simd option like ARM/x86.
> 
> Upstream issue: https://github.com/aircrack-ng/aircrack-ng/issues/1941
> 
> Fixes
> http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> Changes
> v1 -> v2
> [Thomas
>  - Add issue link to Config.in
>  - Reworded description above to note this is a bug
> ---
>  package/aircrack-ng/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

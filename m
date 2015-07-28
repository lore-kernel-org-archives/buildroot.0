From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 09:50:13 +0200
Subject: [Buildroot] [PATCH v2 3/4] cubieboard: update build support for
 cubieboard 1/2/3.
In-Reply-To: <1438067769-10254-3-git-send-email-fancp2007@gmail.com>
References: <1438067769-10254-1-git-send-email-fancp2007@gmail.com>
 <1438067769-10254-3-git-send-email-fancp2007@gmail.com>
Message-ID: <20150728095013.2a332e73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott,

On Tue, 28 Jul 2015 15:16:08 +0800, Scott Fan wrote:
> This patch update the cb1/cb2's defconfig to mainline u-boot version,
> and bump their linux-sunxi kernel to latest stage/sunxi-3.4 branch.
> 
> Additionally, add defconfig for cubieboard3 (a.k.a. cubietruck).
> 
> Finally, support set up the SD card only to boot from network.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

When you post new versions of a patch series, please make sure to
include a changelog of what was modified. Otherwise it's difficult for
people reviewing your patches to figure out what you've changed.

See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for some discussion about this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

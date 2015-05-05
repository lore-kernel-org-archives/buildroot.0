From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:43:39 +0200
Subject: [Buildroot] [PATCH] freerdp: fix build with uClibc
In-Reply-To: <3c74f8fefa032d007e95814c4a6a72f0c88703d8.1430849732.git.baruch@tkos.co.il>
References: <3c74f8fefa032d007e95814c4a6a72f0c88703d8.1430849732.git.baruch@tkos.co.il>
Message-ID: <20150505224339.44e96ee2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  5 May 2015 21:15:32 +0300, Baruch Siach wrote:
> Add upstream patch disabling use of C99 long double math functions (powl,
> ceill, ...) that uClibc(-ng) don't have.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bda/bda53fffd4a0937fd4b2313cdf2d12ced95cc7a7/
> http://autobuild.buildroot.net/results/d96/d9613c9f791157e1de3a34923f1c91b35cec693f/
> http://autobuild.buildroot.net/results/bfd/bfd4ef86b257ee918e3c4463ebc5cf77694244a0/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0003-dont-use-unavailable-c99-math.patch       | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 package/freerdp/0003-dont-use-unavailable-c99-math.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

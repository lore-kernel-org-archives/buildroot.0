From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 22:35:39 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
In-Reply-To: <20210305161211.4396-2-giulio.benetti@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-2-giulio.benetti@benettiengineering.com>
Message-ID: <20210314223539.61a6e9db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Mar 2021 17:12:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> On OpenRisc binutils it still present ld bug 21464 leading to a package
> protobuf to fail building:
> http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/
> 
> The bug was already reported and it's been updated:
> https://sourceware.org/bugzilla/show_bug.cgi?id=21464
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master with a reworked commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

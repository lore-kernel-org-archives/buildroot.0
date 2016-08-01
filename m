From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:02:00 +0200
Subject: [Buildroot] [PATCH] uclibc: disable PIE for microblaze
In-Reply-To: <20160731214126.GA18543@waldemar-brodkorb.de>
References: <20160731214126.GA18543@waldemar-brodkorb.de>
Message-ID: <20160801230200.68cb2fde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 23:41:26 +0200, Waldemar Brodkorb wrote:
> PIE is not supported at the moment for uClibc-ng/microblaze.
> Fixes:
> http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:58:15 +0200
Subject: [Buildroot] [PATCH 17/27] package/lua-cqueues: fix build
 failure due to Gcc Bug 68485
In-Reply-To: <20190614210346.121013-18-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-18-giulio.benetti@micronovasrl.com>
Message-ID: <20190619215815.7f525aff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:36 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package lua-cqueues manifests Microblaze Gcc Bug 68485 resulting in a
> build failure due to an Internal Compiler Error.
> 
> As done for other packages in Buildroot work around this Gcc Bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c35/c35964dda4e2328c2c1f3b2388677b68c5ed461e/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/lua-cqueues/lua-cqueues.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

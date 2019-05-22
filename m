From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 May 2019 22:52:42 +0200
Subject: [Buildroot] [PATCH v2 01/12] toolchain: specify GCC_BUG_85180
 is true only if GCC version < 8.x
In-Reply-To: <20190521133932.81841-2-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190522225242.7efd830c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:21 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> has been fixed on Gcc version >= 8.x
> 
> So:
> - add 'depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8' to 'config
>   BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  toolchain/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master with a tweaked commit log/title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

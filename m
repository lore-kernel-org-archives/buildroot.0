From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:30:06 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/ecryptfs-utils: remove
 libnss gcc bug dependency
In-Reply-To: <20190626125900.48230-4-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-4-giulio.benetti@micronovasrl.com>
Message-ID: <20190803153006.6c7cd51c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 14:58:56 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package libnss has BR2_TOOLCHAIN_HAS_GCC_BUG_85862 dependency and since
> ecryptfs-utils depends on libnss it has to have this dependency too. But
> libnss has been worked around for Gcc Bug 85862 on previous patch, then
> we can remove 'depends on !BR_TOOLCHAIN_HAS_GCC_BUG_85862' and its
> comment from Config.in.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/ecryptfs-utils/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:52:54 +0200
Subject: [Buildroot] [PATCH v5 3/7] package/mesa3d: enable llvm support
In-Reply-To: <20180404163124.27934-4-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
 <20180404163124.27934-4-valentin.korenblit@smile.fr>
Message-ID: <20180404225254.48e550c8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 18:31:20 +0200, Valentin Korenblit wrote:
> This patch provides LLVM support for Mesa3D, enabling llvmpipe
> software rasterizer if Gallium swrast is selected.
> 
> In case Gallium r600 is selected, llvm AMDGPU backend is built.
> 
> Having llvm installed also enables radeonsi Gallium driver, but
> it is not provided with this patch as it hasn't been tested.
> 
> It uses llvm-config (host variant) installed in STAGING_DIR/usr/bin
> to get LLVM libraries. Assuming that LLVM version 5.0.1 is installed,
> llvm-config --libs will output -lLLVM-5.0.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Tested-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

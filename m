From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:52:49 +0200
Subject: [Buildroot] [PATCH v5 2/7] package/llvm: enable AMDGPU
In-Reply-To: <20180404163124.27934-3-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
 <20180404163124.27934-3-valentin.korenblit@smile.fr>
Message-ID: <20180404225249.32ae6686@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 18:31:19 +0200, Valentin Korenblit wrote:
> The AMDGPU backend provides ISA code generation for AMD GPU's,
> starting with the R600 family up until the current GCN families.
> 
> It should not be confused with the AMDGPU Linux kernel DRM driver.
> 
> For more info: https://llvm.org/docs/AMDGPUUsage.html
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

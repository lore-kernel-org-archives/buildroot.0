From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:22:08 +0200
Subject: [Buildroot] [PATCH v2] package/clang: link libclang against
 libLLVM.so
In-Reply-To: <20180511114752.16980-1-valentin.korenblit@smile.fr>
References: <20180511114752.16980-1-valentin.korenblit@smile.fr>
Message-ID: <20180511232208.0cf4d052@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 13:47:52 +0200, Valentin Korenblit wrote:
> libclang.so is statically linking against all LLVM static libraries
> instead of linking dynamically against libLLVM.so.
> 
> This patch fixes this problem by setting LLVM_LINK_LLVM_DYLIB to ON.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

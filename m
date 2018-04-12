From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:16:37 +0200
Subject: [Buildroot] [PATCH] package/llvm: fix typo in llvm.mk
In-Reply-To: <20180412120236.1499-1-valentin.korenblit@smile.fr>
References: <20180412120236.1499-1-valentin.korenblit@smile.fr>
Message-ID: <20180412211637.33f4662d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 14:02:36 +0200, Valentin Korenblit wrote:
> "+=" was missing in -DLLVM_TARGETS_TO_BUILD, so LLVM_CONF_OPTS and
> HOST_LLVM_CONF_OPTS before this option weren't being considered.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/llvm/llvm.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

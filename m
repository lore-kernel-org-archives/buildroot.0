From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 11:37:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/llvm: delete LLVMHello.so from
 /usr/lib
In-Reply-To: <20180502090535.29498-2-valentin.korenblit@smile.fr>
References: <20180502090535.29498-1-valentin.korenblit@smile.fr>
 <20180502090535.29498-2-valentin.korenblit@smile.fr>
Message-ID: <20180502113715.205d78a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 11:05:35 +0200, Valentin Korenblit wrote:
> LLVMHello.so contains the Hello World example of an
> LLVM pass. It is not needed on the target.
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:11:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: add dependency on shared
 libraries
In-Reply-To: <20180409094607.11677-1-valentin.korenblit@smile.fr>
References: <20180409094607.11677-1-valentin.korenblit@smile.fr>
Message-ID: <20180409211140.45702eb7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 11:46:06 +0200, Valentin Korenblit wrote:
> llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set
> 
> Also propagate llvm dependency to mesa3d.
> 
> Link to report from autobuilders:
> http://lists.busybox.net/pipermail/buildroot/2018-April/218296.html
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/llvm/Config.in   | 6 ++++--
>  package/mesa3d/Config.in | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

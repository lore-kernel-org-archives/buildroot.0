From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:32:13 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils
 for R600 with LLVM
In-Reply-To: <20180411125701.8259-1-valentin.korenblit@smile.fr>
References: <20180411125701.8259-1-valentin.korenblit@smile.fr>
Message-ID: <20180412233213.3dc1832e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 14:57:01 +0200, Valentin Korenblit wrote:
> Gallium R600 needs libelf when mesa is built with llvm support.
> Because of this, toolchain must use either uClibc or glibc, as
> musl is not currently compatible with elfutils.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/mesa3d/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:46:43 +0100
Subject: [Buildroot] [PATCH 01/16 v4] toolchain/external: newer Linaro
 toolchains do not provide source code
In-Reply-To: <d106bdc792390e59a0504330df5d663c66758590.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <d106bdc792390e59a0504330df5d663c66758590.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <20160203234643.74b8c062@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  3 Feb 2016 23:21:51 +0100, Yann E. MORIN wrote:
> Currently, we have a pattern-matching that automatically derives the
> the source tarball filename from the binary tarball filename.
> 
> However, the latest Linaro toolchains no longer follow that scheme (and
> do not even readily provide the sources...).
> 
> Remove the generic pattern-matching, and explicitly set the source
> tarball name for those toolchains that do have a source tarball readily
> available.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

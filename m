From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:39:48 +0200
Subject: [Buildroot] [PATCH 2/6] toolchain: use the
 <PKG>_TARGET_FINALIZE_HOOKS
In-Reply-To: <c147ef54ea80186f8a9e2582da525fb1ec457b5b.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
 <c147ef54ea80186f8a9e2582da525fb1ec457b5b.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <20160718233948.7d635f2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 10:44:24 +0200, Yann E. MORIN wrote:
> Register toolchain-specific target-finalize hooks with the
> newly-introduced <PKG>_TARGET_FINALIZE_HOOKS.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

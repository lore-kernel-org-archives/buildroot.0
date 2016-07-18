From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:46:46 +0200
Subject: [Buildroot] [PATCH 4/6] system: move the rootfs skeleton choice
In-Reply-To: <0d652d8d1753cde7788f538ac480f2724d5a2040.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
 <0d652d8d1753cde7788f538ac480f2724d5a2040.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <20160718234646.32fba134@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 10:44:26 +0200, Yann E. MORIN wrote:
> In the following commits, we'll be switching more options to be
> conditional on the default or custom skeleton.
> 
> So, it makes sense that those options come after the choice of a
> skeleton.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> ---
>  system/Config.in | 56 ++++++++++++++++++++++++++++----------------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)

Patches 4 to 6 applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

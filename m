From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:22:23 +0200
Subject: [Buildroot] [PATCH] package/libunwind: simplify architectutre
 dependencies
In-Reply-To: <20170417164401.24236-1-yann.morin.1998@free.fr>
References: <20170417164401.24236-1-yann.morin.1998@free.fr>
Message-ID: <20170504232223.1e7bd082@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 18:44:01 +0200, Yann E. MORIN wrote:
> BR2_ARM_CPU_HAS_ARM already embeddeds the fact that this is an ARM chip,
> so (BR2_arm || BR2_armeb) is forcibly true when BR2_ARM_CPU_HAS_ARM is.
> 
> In other words, BR2_ARM_CPU_HAS_ARM can't be true unless either BR2_arm
> or BR2_armeb itslef is true.
> 
> Simplify the logic accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libunwind/Config.in | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied to master, after fixing the typo in the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

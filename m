From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:07:24 +0200
Subject: [Buildroot] [PATCH] package/odroid-scripts: relax dependencies
 to include armeb
In-Reply-To: <20170512191509.25736-1-yann.morin.1998@free.fr>
References: <20170512191509.25736-1-yann.morin.1998@free.fr>
Message-ID: <20170513150724.1456cebf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 21:15:09 +0200, Yann E. MORIN wrote:
> odroid-scripts are just scripts, so they should also work on a armeb
> board.
> 
> Besides, odroid-mali selects it, but it only depends on arm-eabihf,
> which means armeb is not ruled out.
> 
> Fixes unmet dependencies (with BR2_armeb=y):
>     warning: (BR2_PACKAGE_ODROID_MALI) selects BR2_PACKAGE_ODROID_SCRIPTS
>     which has unmet direct dependencies(BR2_aarch64 || BR2_arm)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Dagg Stompler <daggs@gmx.com>
> ---
>  package/odroid-scripts/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

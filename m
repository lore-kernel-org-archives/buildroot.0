From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:39:08 +0200
Subject: [Buildroot] [PATCH] package/xen: force location of init scripts
In-Reply-To: <20180513165923.31057-1-yann.morin.1998@free.fr>
References: <20180513165923.31057-1-yann.morin.1998@free.fr>
Message-ID: <20180513213908.3439adaa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 18:59:23 +0200, Yann E. MORIN wrote:
> The Xen configure scripts looks at the build host to decide where to
> install the Sys-V startup scripts, and that location differs between
> various distros.
> 
> Force the location.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/869/869829ab086e824d164c5c5ec7f087ed83993be6/
>     http://autobuild.buildroot.org/results/336/3360e5a9e3d007b4ed77345b5fe93b2dacb6ad49/
>     http://autobuild.buildroot.org/results/29e/29e308ce3cc9c83497ba1c1f98fcda3f48fd03c4/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> ---
>  package/xen/xen.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:38:43 +0200
Subject: [Buildroot] [PATCH] package/rauc: add workaround for older
 kernel headers
In-Reply-To: <20180513124045.25048-1-yann.morin.1998@free.fr>
References: <20180513124045.25048-1-yann.morin.1998@free.fr>
Message-ID: <20180513213843.400ba94f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 14:40:45 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/621/621587906bd2bb27c43b6fcbb051d75f20e32e7c/
>     http://autobuild.buildroot.org/results/52c/52ca760f0227075ca988754bb9eb8df0ea3e1563/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Andrey Yurovsky <yurovsky@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - fix header filename
> ---
>  ...001-emmc-add-workaround-for-older-kernels.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/rauc/0001-emmc-add-workaround-for-older-kernels.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

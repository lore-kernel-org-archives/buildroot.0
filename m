From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:29:51 +0200
Subject: [Buildroot] [PATCH 5/8 v11] package/xserver_xorg-server: add
 version 1.14.7
In-Reply-To: <7c1cccc2773ed740d1c418d1437c629839849f73.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <7c1cccc2773ed740d1c418d1437c629839849f73.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426222951.5fc02f8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:41 +0200, Yann E. MORIN wrote:
> Some old binary blobs drivers, like the NVidia Tegra2/3 blobs, only
> implement an old VIDEODRV ABI.
> 
> Since VIDEODRV ABIs are not backward compatible [0], lets introduce an
> older Xserver version that supports such an old ABI.
> 
> [0] http://www.x.org/wiki/XorgModuleABIVersions/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/Config.in | 9 +++++++++
>  1 file changed, 9 insertions(+)

As noticed by Nicolas, I've added a hash for 1.14.7.

> +config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14_7

and renamed that to BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:23:00 +0200
Subject: [Buildroot] [PATCH v2 4/6] package/xserver_xorg-server: add
 version 1.17.4
In-Reply-To: <1468315820-9341-5-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-5-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160715152300.5c0f0e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 11:30:18 +0200, Romain Perier wrote:
> Some old binary blobs drivers only implement an old VIDEODRV ABI. This
> is the case for the AMD Catalyst driver for example.
> 
> Such a situation already exists with the nvidia-tegra23, that only
> support the VIDEODRV ABI 14.
> 
> Since VIDEODRV ABIs are not backward compatible [0], lets introduce an
> older Xserver version that supports such an old ABI.
> 
> 0. https://www.x.org/wiki/XorgModuleABIVersions/
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
>  package/x11r7/xserver_xorg-server/Config.in                | 10 ++++++++++
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash |  2 ++
>  2 files changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

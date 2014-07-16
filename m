From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:00:35 +0200
Subject: [Buildroot] [PATCH v14 02/20] package/mesa3d: Depend on xorg
 meta package instead of xserver_xorg-server
In-Reply-To: <1405451955-10204-3-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
 <1405451955-10204-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140716200035.52215259@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 15 Jul 2014 21:18:57 +0200, Bernd Kuhls wrote:
> mesa3d does not depend on the xorg server as such, only on X libraries.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in |   22 +++++++++++-----------
>  package/mesa3d/mesa3d.mk |    4 ++--
>  2 files changed, 13 insertions(+), 13 deletions(-)

This patch does not apply on the current Buildroot, git complains that
there are some missing blobs. It generally indicates that your branch
wasn't based on master, but on master + several commits that are not
part of this patch series. Could you check this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

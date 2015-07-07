From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 10:37:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: If udev is not present,
 sysfs is used as a replacement
In-Reply-To: <1433677262-7640-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433677262-7640-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150707103732.782fcae1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Jun 2015 13:41:02 +0200, Bernd Kuhls wrote:
> Support for sysfs as a replacement for udev was added 2014/05/30:
> http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=85b6f36ca5238dd3fec7c5fcacb8b7074ce53c8e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in |   10 ++--------
>  package/mesa3d/mesa3d.mk |    9 +++++++--
>  2 files changed, 9 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:25:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.19.6
In-Reply-To: <20171220222510.433-1-bernd.kuhls@t-online.de>
References: <20171220222510.433-1-bernd.kuhls@t-online.de>
Message-ID: <20171228232503.33f54281@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Dec 2017 23:25:10 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../{1.19.5 => 1.19.6}/0001-modesettings-needs-dri2.patch      |  0
>  .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch      |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch                |  0
>  package/x11r7/xserver_xorg-server/Config.in                    |  4 ++--
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash     | 10 +++++-----
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.19.5 => 1.19.6}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.19.5 => 1.19.6}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.19.5 => 1.19.6}/0003-Remove-check-for-useSIGIO-option.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

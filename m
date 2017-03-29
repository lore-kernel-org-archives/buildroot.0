From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:35:50 +0200
Subject: [Buildroot] [PATCH 1/1] Remove whitespaces
In-Reply-To: <20170326150543.6387-1-bernd.kuhls@t-online.de>
References: <20170326150543.6387-1-bernd.kuhls@t-online.de>
Message-ID: <20170329233550.2e874414@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 17:05:43 +0200, Bernd Kuhls wrote:
> To search for them I used this regex:
> 
> [ ]{1,}\t
> 
> and manually removed them in most of the cases.
> 
> For xserver_xorg-server.mk I decided to remove the tabs instead.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  arch/Config.in.arc                                 |  2 +-
>  arch/Config.in.arm                                 | 16 ++---
>  arch/Config.in.mips                                |  2 +-
>  linux/linux-ext-rtai.mk                            |  4 +-
>  linux/linux.mk                                     |  6 +-
>  package/bluez5_utils/bluez5_utils.mk               |  6 +-
>  package/lesstif/lesstif.mk                         |  8 +--
>  package/linux-firmware/linux-firmware.mk           |  2 +-
>  package/netsnmp/netsnmp.mk                         |  2 +-
>  package/pkg-generic.mk                             |  2 +-
>  package/pkg-kernel-module.mk                       |  2 +-
>  package/pkg-waf.mk                                 |  6 +-
>  package/python/python.mk                           |  6 +-
>  package/python3/python3.mk                         |  6 +-
>  package/rt-tests/rt-tests.mk                       |  6 +-
>  package/rtai/rtai.mk                               |  4 +-
>  package/udisks/udisks.mk                           |  2 +-
>  package/usbmount/usbmount.mk                       |  4 +-
>  .../xserver_xorg-server/xserver_xorg-server.mk     | 82 +++++++++++-----------
>  19 files changed, 84 insertions(+), 84 deletions(-)

Applied to master, thanks. However, next time, please avoid using the
first person ("I") in your commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

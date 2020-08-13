From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:11:45 +0200
Subject: [Buildroot] [PATCH v2 1/2]
 package/{gnuradio|opencv3|python-matplotlib|qt5|qwt|wireshark}: drop
 redundant BR2_PACKAGE_QT5BASE select
In-Reply-To: <20200811212303.13607-1-ps.report@gmx.net>
References: <20200811212303.13607-1-ps.report@gmx.net>
Message-ID: <20200813231145.46f8f7c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 23:23:02 +0200
Peter Seiderer via buildroot <buildroot@busybox.net> wrote:

> Drop redundant BR2_PACKAGE_QT5BASE select as BR2_PACKAGE_QT5 already
> implies select BR2_PACKAGE_QT5BASE (see package/qt5/Config.in).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - new patch to fix recursive dependency warning
> ---
>  package/gnuradio/Config.in            | 1 -
>  package/opencv3/Config.in             | 1 -
>  package/python-matplotlib/Config.in   | 1 -
>  package/qt5/qt53d/Config.in           | 1 -
>  package/qt5/qt5charts/Config.in       | 1 -
>  package/qt5/qt5connectivity/Config.in | 1 -
>  package/qt5/qt5declarative/Config.in  | 1 -
>  package/qt5/qt5imageformats/Config.in | 1 -
>  package/qt5/qt5location/Config.in     | 1 -
>  package/qt5/qt5multimedia/Config.in   | 1 -
>  package/qt5/qt5script/Config.in       | 1 -
>  package/qt5/qt5scxml/Config.in        | 1 -
>  package/qt5/qt5sensors/Config.in      | 1 -
>  package/qt5/qt5serialbus/Config.in    | 1 -
>  package/qt5/qt5serialport/Config.in   | 1 -
>  package/qt5/qt5svg/Config.in          | 1 -
>  package/qt5/qt5webchannel/Config.in   | 1 -
>  package/qt5/qt5webkit/Config.in       | 1 -
>  package/qt5/qt5websockets/Config.in   | 1 -
>  package/qt5/qt5xmlpatterns/Config.in  | 1 -
>  package/qwt/Config.in                 | 1 -
>  package/wireshark/Config.in           | 1 -
>  22 files changed, 22 deletions(-)

Thanks, both patches applied to master. I've added the Acked-by from
Yann, which he gave on IRC.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

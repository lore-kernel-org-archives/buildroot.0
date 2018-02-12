From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 12 Feb 2018 16:07:03 -0500
Subject: [Buildroot] [RFC 1/2] qt5: bump latest version to 5.10.0
In-Reply-To: <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
Message-ID: <20180212210702.lh2ho73ivp4ckov7@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Feb 11, 2018 at 11:13:19AM -0500, Ga?l PORTAY wrote:
> Hashes has been updated using the following script:
> ...
> ---
>  package/qt5/Config.in                                    | 4 ++--
>  package/qt5/qt5.mk                                       | 8 ++++++--
>  package/qt5/qt53d/qt53d.hash                             | 4 ++--
>  package/qt5/qt53d/qt53d.mk                               | 2 +-
>  package/qt5/qt5base/qt5base.hash                         | 4 ++--
>  package/qt5/qt5base/qt5base.mk                           | 2 +-
>  package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
>  package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
>  package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
>  package/qt5/qt5charts/qt5charts.mk                       | 2 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
>  package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
>  package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
>  package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
>  package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
>  package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
>  package/qt5/qt5location/qt5location.hash                 | 4 ++--
>  package/qt5/qt5location/qt5location.mk                   | 2 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
>  package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
>  package/qt5/qt5script/qt5script.hash                     | 4 ++--
>  package/qt5/qt5script/qt5script.mk                       | 2 +-
>  package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
>  package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
>  package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
>  package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
>  package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
>  package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
>  package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
>  package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
>  package/qt5/qt5svg/qt5svg.mk                             | 2 +-
>  package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
>  package/qt5/qt5tools/qt5tools.mk                         | 2 +-
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
>  package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
>  package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
>  package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
>  package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
>  package/qt5/qt5webengine/qt5webengine.mk                 | 2 +-
>  package/qt5/qt5webkit-examples/qt5webkit-examples.mk     | 2 +-
>  package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
>  package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
>  package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
>  56 files changed, 88 insertions(+), 84 deletions(-)
> 

In the next version of the patch, I will remove the three patches
(5.9.3) since they are all upstreamed in 5.10.

Regards,
Gael

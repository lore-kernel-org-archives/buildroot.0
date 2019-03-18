From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 23:06:10 +0100
Subject: [Buildroot] [PATCH v1] package/qt5: bump latest version to
 5.12.2
In-Reply-To: <20190318212344.11501-1-ps.report@gmx.net>
References: <20190318212344.11501-1-ps.report@gmx.net>
Message-ID: <20190318230610.77430984@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 22:23:44 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                                            | 2 +-
>  package/qt5/qt53d/qt53d.hash                                  | 4 ++--
>  .../0001-qtbase-Fix-build-error-when-using-EGL.patch          | 0
>  .../0004-double-conversion-enable-for-microblaze.patch        | 0
>  package/qt5/qt5base/{5.12.1 => 5.12.2}/qt5base.hash           | 4 ++--
>  package/qt5/qt5canvas3d/qt5canvas3d.hash                      | 4 ++--
>  package/qt5/qt5charts/qt5charts.hash                          | 4 ++--
>  .../qt5connectivity/{5.12.1 => 5.12.2}/qt5connectivity.hash   | 4 ++--
>  .../0001-qsgtexture-fix-debug-build-with-uclibc.patch         | 0
>  package/qt5/qt5declarative/qt5declarative.hash                | 4 ++--
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash      | 4 ++--
>  package/qt5/qt5imageformats/qt5imageformats.hash              | 4 ++--
>  package/qt5/qt5location/qt5location.hash                      | 4 ++--
>  package/qt5/qt5multimedia/qt5multimedia.hash                  | 4 ++--
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash            | 4 ++--
>  .../{5.12.1 => 5.12.2}/qt5quickcontrols2.hash                 | 4 ++--
>  package/qt5/qt5script/qt5script.hash                          | 4 ++--
>  package/qt5/qt5scxml/qt5scxml.hash                            | 4 ++--
>  package/qt5/qt5sensors/qt5sensors.hash                        | 4 ++--
>  package/qt5/qt5serialbus/{5.12.1 => 5.12.2}/qt5serialbus.hash | 4 ++--
>  .../qt5/qt5serialport/{5.12.1 => 5.12.2}/qt5serialport.hash   | 4 ++--
>  package/qt5/qt5svg/qt5svg.hash                                | 4 ++--
>  package/qt5/qt5tools/qt5tools.hash                            | 4 ++--
>  .../{5.12.1 => 5.12.2}/qt5virtualkeyboard.hash                | 4 ++--
>  package/qt5/qt5wayland/qt5wayland.hash                        | 4 ++--
>  package/qt5/qt5webchannel/qt5webchannel.hash                  | 4 ++--
>  package/qt5/qt5webengine/{5.12.1 => 5.12.2}/qt5webengine.hash | 4 ++--
>  package/qt5/qt5websockets/qt5websockets.hash                  | 4 ++--
>  package/qt5/qt5x11extras/{5.12.1 => 5.12.2}/qt5x11extras.hash | 4 ++--
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash                | 4 ++--
>  30 files changed, 53 insertions(+), 53 deletions(-)
>  rename package/qt5/qt5base/{5.12.1 => 5.12.2}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
>  rename package/qt5/qt5base/{5.12.1 => 5.12.2}/0004-double-conversion-enable-for-microblaze.patch (100%)
>  rename package/qt5/qt5base/{5.12.1 => 5.12.2}/qt5base.hash (81%)
>  rename package/qt5/qt5connectivity/{5.12.1 => 5.12.2}/qt5connectivity.hash (74%)
>  rename package/qt5/qt5declarative/{5.12.1 => 5.12.2}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
>  rename package/qt5/qt5quickcontrols2/{5.12.1 => 5.12.2}/qt5quickcontrols2.hash (66%)
>  rename package/qt5/qt5serialbus/{5.12.1 => 5.12.2}/qt5serialbus.hash (71%)
>  rename package/qt5/qt5serialport/{5.12.1 => 5.12.2}/qt5serialport.hash (74%)
>  rename package/qt5/qt5virtualkeyboard/{5.12.1 => 5.12.2}/qt5virtualkeyboard.hash (78%)
>  rename package/qt5/qt5webengine/{5.12.1 => 5.12.2}/qt5webengine.hash (99%)
>  rename package/qt5/qt5x11extras/{5.12.1 => 5.12.2}/qt5x11extras.hash (74%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

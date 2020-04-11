From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 12 Apr 2020 00:21:19 +0200
Subject: [Buildroot] [Patch for 2020.02.x v1] package/qt5: bump latest
 version to 5.12.8
In-Reply-To: <20200411221015.12702-1-ps.report@gmx.net>
References: <20200411221015.12702-1-ps.report@gmx.net>
Message-ID: <20200412002119.1cdabfe6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Sun, 12 Apr 2020 00:10:15 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                                       | 2 +-
>  package/qt5/qt53d/qt53d.hash                             | 4 ++--
>  package/qt5/qt5base/qt5base.hash                         | 4 ++--
>  package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
>  package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
>  package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
>  package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
>  package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
>  package/qt5/qt5location/qt5location.hash                 | 4 ++--
>  package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
>  package/qt5/qt5script/qt5script.hash                     | 4 ++--
>  package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
>  package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
>  package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
>  package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
>  package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
>  package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
>  package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
>  package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
>  package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
>  package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
>  package/qt5/qt5webview/qt5webview.hash                   | 4 ++--
>  package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
>  28 files changed, 55 insertions(+), 55 deletions(-)
>
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 7805b575f5..28de0e5b70 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  QT5_VERSION_MAJOR = 5.12
> -QT5_VERSION = $(QT5_VERSION_MAJOR).7
> +QT5_VERSION = $(QT5_VERSION_MAJOR).8
>  QT5_SOURCE_TARBALL_PREFIX = everywhere-src
>  QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
>
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 54dbda367d..7ed0e4bca3 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qt3d-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 2030de3dc93fd4062f677f61938229af9cd7aa4c3d2932cdda2ccb663d681126 qt3d-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qt3d-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  066d360df173c024264c957546b8265ac14e44ef8007a181e1d723399f7c1257  qt3d-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 0697464cb9..70b90f09f4 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtbase-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 b18939cb25d90aef8721fb12ec34c3632d3490ced958e41f6c7a52064643665d qtbase-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtbase-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  19592fbd0a524a17c35e413988fe494251103619ef7dd49aecdf3170973aabd8  qtbase-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
> index c6eca2e779..8acb223220 100644
> --- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
> +++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcanvas3d-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 b63a513a2ee11548b122e0fd640b1fa22d3eb83cdc51ddfdf3b97c2ecd0d0c50 qtcanvas3d-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtcanvas3d-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  a30deda1021266b3be4d016474fbf4df6b40356ff870c026320204f2364d12cc  qtcanvas3d-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> index 10a92bd55f..57c53b1f74 100644
> --- a/package/qt5/qt5charts/qt5charts.hash
> +++ b/package/qt5/qt5charts/qt5charts.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtcharts-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 434065526d0b1d8921e96cc1827b1a3579e073b930fe536455c4c1da2f15cf5f qtcharts-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtcharts-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  ded463b3f99bf5cc5fe39ed2d70183948c6e955430ce0b21eb235b5c13bc9d16  qtcharts-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
> index 9af3a57c12..9a00e5605b 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.hash
> +++ b/package/qt5/qt5connectivity/qt5connectivity.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtconnectivity-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 647148b9b1a0d3e54f788b66797b81bb87434faf6fb12ac481f9165eda0d071a qtconnectivity-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtconnectivity-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  dd4d7b291e5ad88d9e9c34e9c5419923498f5264bd3deb9a5da556943f2931e3  qtconnectivity-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
> index 85e99082f3..b6706b8aed 100644
> --- a/package/qt5/qt5declarative/qt5declarative.hash
> +++ b/package/qt5/qt5declarative/qt5declarative.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtdeclarative-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 5cdc05a035f240ab73b6b37dd3831c1350cd80e5799da47929974085f6eae9bd qtdeclarative-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtdeclarative-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  7e1059be9f3faab6fd3d40b58666798963bb9d9c5442d5d16e6870c51327160b  qtdeclarative-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> index ae800fe07a..e2c9dbc816 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtgraphicaleffects-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 02f0328420c623da8f9ae949fec01e99ba84213dd2ad559cb00c204502bbcace qtgraphicaleffects-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtgraphicaleffects-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  660acc87a084d2e404c2c5ddc0317f0d8a7b5292c889c9f37134e32ed7a33954  qtgraphicaleffects-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
> index 3358b6d79c..2d32dd6ec2 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.hash
> +++ b/package/qt5/qt5imageformats/qt5imageformats.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtimageformats-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 9bd19ee24fb85f249d01c78e637c95377dd738feb61da0deeee6b770fa62f70b qtimageformats-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtimageformats-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  e176463c49762152131c93d6b02f1b1ff72fcd0aae3092c9fa05e57464d043b0  qtimageformats-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
> index 3c94df0079..235e38120e 100644
> --- a/package/qt5/qt5location/qt5location.hash
> +++ b/package/qt5/qt5location/qt5location.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtlocation-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 d1e905b80befda3c9aaad92ea984e6dbf722568b5c91e8d15b027bc5bc22781f qtlocation-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtlocation-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  ffe3c5183744743b476230b644c71a931e5822c5107b02607000e0e1f1a34b0a  qtlocation-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
> index a4df5af5dc..eb310836bd 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.hash
> +++ b/package/qt5/qt5multimedia/qt5multimedia.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtmultimedia-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 28bdaa81371f922223775ae5171c4d589a2c07f255abbe5ccf130ecbbdb4db1d qtmultimedia-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtmultimedia-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  26fc117f6ad012ac140353ade4371c234d6d73492f834f93b0b200b8b5552fe2  qtmultimedia-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> index a0f8dab10b..9f003bdd59 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 1038bbc76bba53f9634f40cd9c8ebf0ed8ae82e791f727b228bd81bdcf1859e5 qtquickcontrols-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtquickcontrols-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  5d93b4107d4b14115a4d1692b533790b43d15cdf81325036ca15044592c81d38  qtquickcontrols-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> index 689a7e5284..9241a366f7 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols2-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 3a9526e5ad01edbfb796a6631983c391ea1b7e22ae6e07840048156a9e92a237 qtquickcontrols2-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtquickcontrols2-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  a0c5646b27290cfdea6f26c58b9ddd6f177b39ac2e6d27cd7e19d8b560dc4920  qtquickcontrols2-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
> diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
> index 8d87cd6f60..57d28e4907 100644
> --- a/package/qt5/qt5script/qt5script.hash
> +++ b/package/qt5/qt5script/qt5script.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscript-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 ca1dbc66d4125a678638dd0c9c030b72fdfc4ec2c229b9316a8bc80a86104019 qtscript-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtscript-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  c8c13582bab8562792fab29f574768ef9fb2cdd232c102228cc511dbfc4b1097  qtscript-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
> index 83ba0da838..eb177f7cd2 100644
> --- a/package/qt5/qt5scxml/qt5scxml.hash
> +++ b/package/qt5/qt5scxml/qt5scxml.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtscxml-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 afa950bc95f881c90eea564511f3e9918d53fddf0823afb641d20dc6f794fbb6 qtscxml-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtscxml-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  c07020b510b20c0424a5bc58bd83337bd1c44d5fd996aa8179ad1113eb015ad2  qtscxml-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>
> diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
> index dba376d9a6..2b04fb9d51 100644
> --- a/package/qt5/qt5sensors/qt5sensors.hash
> +++ b/package/qt5/qt5sensors/qt5sensors.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsensors-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 2b9aea9f4e2f681b4067f2b9d97c5073c135e41d26601c71f18f199bc980e740 qtsensors-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsensors-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  48f3c25e32a6b19a203188d7e52ad257b3ac23781ee80bea933d721e270d297a  qtsensors-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
> index fa3ccc1475..2f6b5c45cf 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.hash
> +++ b/package/qt5/qt5serialbus/qt5serialbus.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialbus-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 82201edf971e957d849b041ab2914f7497226939c62884ec2906b37576987eae qtserialbus-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtserialbus-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  77d09c99c6a15f3de442fc734d5af7452af273f5c002fc79fdaf527071abcc9c  qtserialbus-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
> index 43136542d8..00d599d46c 100644
> --- a/package/qt5/qt5serialport/qt5serialport.hash
> +++ b/package/qt5/qt5serialport/qt5serialport.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialport-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 224c282ebed750f46b72dfe18260c3d26fbb74e928dec64bd8c51e7beed8721f qtserialport-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtserialport-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  66d989498a84313ce843095082396f279ee43e7828aef967b1b447fce68056ea  qtserialport-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
> index d3128a60bc..ffb4fe4199 100644
> --- a/package/qt5/qt5svg/qt5svg.hash
> +++ b/package/qt5/qt5svg/qt5svg.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtsvg-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 4bf60916d4e398d9609f1b3a17fc7345a0e13c7c1cc407298df20da4c7c67bb8 qtsvg-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtsvg-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  af2aad75a48c2e4ad70aa298decceb5afc41d499aec119ad72635363a2dfbb5d  qtsvg-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
> index d6b2b50932..ba880076a5 100644
> --- a/package/qt5/qt5tools/qt5tools.hash
> +++ b/package/qt5/qt5tools/qt5tools.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qttools-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 860a97114d518f83c0a9ab3742071da16bb018e6eb387179d5764a8dcca03948 qttools-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qttools-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  21347e8e2422689d63a08195e27c637983c0d4261d5205ce6b493a2adfe826b4  qttools-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> index 668f971bea..2a502b499b 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 aaa52aaff923df22de8472d71843dadb80f3f6fe0312122e64ffe5436db40daa qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtvirtualkeyboard-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  06c08200007f58cdcc0ceddd161e5d92a6f3e326d5e7c122dcc9ef9fed853c88  qtvirtualkeyboard-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> index 1ffa22cadf..88b85a8a17 100644
> --- a/package/qt5/qt5wayland/qt5wayland.hash
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwayland-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 fc1ab8e25461580e37090e4f82422411dee71a3de48a54be1f4b6569e00f66c5 qtwayland-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwayland-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  16dddccf0618be00f8396e6b5257e62a57022819d2db581b975258c716b9824a  qtwayland-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
> index d45f293821..22939ef3fb 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.hash
> +++ b/package/qt5/qt5webchannel/qt5webchannel.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebchannel-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 b0ae72e5957aa4b281a37d2e169fcf91f92382bc36bd0cf09c80b2bb961bce75 qtwebchannel-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebchannel-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  8c45904dd03842c509f689d4227b025b7598b6dedd6905c01f7e562f2b18fbe9  qtwebchannel-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> index 8308ef4920..03d70d207f 100644
> --- a/package/qt5/qt5webengine/qt5webengine.hash
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebengine-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 83b754dca3dafeb21be6c7cb5ea99f11f5dbe9055bc1680f5bd7159224bb46fa qtwebengine-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebengine-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  cc7d1467055ca0c6b39a7d3d8f18d7f963070b456ff644bbf2ded555b8e45e94  qtwebengine-everywhere-src-5.12.8.tar.xz
>
>  # Locally calculated
>  sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
> diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
> index 230aab232c..293b8fa9f7 100644
> --- a/package/qt5/qt5websockets/qt5websockets.hash
> +++ b/package/qt5/qt5websockets/qt5websockets.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebsockets-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 6fd13c2558f532a32f20d977b44c0146107a0e93861df84978e4fd72af283b17 qtwebsockets-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebsockets-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  aa4fe8ac7cffb86745aa4441c4dcaa8965b77a629755b430dac5a98d04be8465  qtwebsockets-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
> index 7bbb23556b..e00e73719d 100644
> --- a/package/qt5/qt5webview/qt5webview.hash
> +++ b/package/qt5/qt5webview/qt5webview.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtwebview-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 d3f82d2ceab59dc4dee3b6f54f4b70869c199d63f4534b299d900cdacc9b7be7 qtwebview-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwebview-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  f6492f01c3c0b2b44ffdd9e7d55d11d39e960ea0080cd29555d0a1be43366de4  qtwebview-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
> index 06cdb9c87b..bdfec234b9 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.hash
> +++ b/package/qt5/qt5x11extras/qt5x11extras.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtx11extras-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 23895f4b1e84f3783526b9e17680df38c587601d4dfa6ff1b81ace432c480b96 qtx11extras-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtx11extras-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  e17f41267aaea2bb182f4d7cb4f6a1a3c4865107b0c5dd715b504f4d648a0ab9  qtx11extras-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> index 5e61928ea7..0f82d3450b 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtxmlpatterns-everywhere-src-5.12.7.tar.xz.sha256
> -sha256 9002014129a1f2a44700df333a7776e23bdfd689e7a619c3540fd9f6819b417b qtxmlpatterns-everywhere-src-5.12.7.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtxmlpatterns-everywhere-src-5.12.8.tar.xz.sha256
> +sha256  10bee783e4a9fcee312cd03c7d288e5811dd9d0fe9aec828baabcd05dd47144e  qtxmlpatterns-everywhere-src-5.12.8.tar.xz
>
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2

Please ignore this one, patch was against the wrong branch....updated one will
follow, sorry for the noise...

Regards,
Peter

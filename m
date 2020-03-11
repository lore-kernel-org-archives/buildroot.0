From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:35:06 +0100
Subject: [Buildroot] [PATCH v6 08/28] package/qt5virtualkeyboard:
 Convert to qmake infra
In-Reply-To: <20200217212350.29750-9-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-9-anaumann@ultratronik.de>
Message-ID: <20200311223506.4483d55e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:30 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> It seems the old method was missing some files from the install
> step since after the conversion the the following additional files
> appear in target after a build with all config options selected:
> usr/lib/qt/plugins/lipi_toolkit/libactivedtw.so
> usr/lib/qt/plugins/lipi_toolkit/libboxfld.so
> usr/lib/qt/plugins/lipi_toolkit/libl7.so
> usr/lib/qt/plugins/lipi_toolkit/liblipiengine.so
> usr/lib/qt/plugins/lipi_toolkit/liblogger.so
> usr/lib/qt/plugins/lipi_toolkit/libneuralnet.so
> usr/lib/qt/plugins/lipi_toolkit/libnn.so
> usr/lib/qt/plugins/lipi_toolkit/libnpen.so
> usr/lib/qt/plugins/lipi_toolkit/libpointfloat.so
> usr/lib/qt/plugins/lipi_toolkit/libpreproc.so
> usr/lib/qt/plugins/lipi_toolkit/libsubstroke.so
> usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_lipi.so
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 63 ++-----------------
>  1 file changed, 4 insertions(+), 59 deletions(-)

Applied to master after fixing the conflicts and dropping the qt5base
dependency. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

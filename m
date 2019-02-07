From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Feb 2019 22:45:37 +0100
Subject: [Buildroot] [git commit] package/gnuradio: disable xml document
 generation
Message-ID: <20190207214424.6690683F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e43cbb3cc1c3da692563549287a4e0433dfc3f4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/f94/f941d84c781b524530770f5b9360863a821e8ba1/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d6d07f6566..202c2213a7 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -26,7 +26,8 @@ GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
-	-DENABLE_GR_QTGUI=OFF
+	-DENABLE_GR_QTGUI=OFF \
+	-DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
 # compile time.

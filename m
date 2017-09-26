From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:33:15 +0200
Subject: [Buildroot] [git commit] imx6-sabresd/readme: Add an entry for
	glmark benchmark
Message-ID: <20170926222615.DEE637FBC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fceb81781eb56f000db3432a4f6f2397ab9363d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an entry to explain how to run the glmark benchmark.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/imx6-sabresd/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index a4ecfae..2943f8b 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -82,4 +82,8 @@ Running Qt5 Cinematic Demo:
 # export QT_QPA_EGLFS_KMS_CONFIG=/root/sabresd.json
 # /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
 
+Running gl2mark benchmark:
+
+# glmark2-es2-drm
+
 Enjoy!

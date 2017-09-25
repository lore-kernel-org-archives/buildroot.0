From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Sep 2017 08:59:48 -0300
Subject: [Buildroot] [PATCH 6/6] imx6-sabresd/readme: Add an entry for
	glmark benchmark
In-Reply-To: <1506340788-9662-1-git-send-email-festevam@gmail.com>
References: <1506340788-9662-1-git-send-email-festevam@gmail.com>
Message-ID: <1506340788-9662-6-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an entry to explain how to run the glmark benchmark.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.7.4

From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 16 Dec 2018 18:27:34 -0500
Subject: [Buildroot] [PATCH v3 2/2] prerequisite.txt: Bump python dependency
 to 2.7
In-Reply-To: <20181216232734.100068-1-aduskett@gmail.com>
References: <20181216232734.100068-1-aduskett@gmail.com>
Message-ID: <20181216232734.100068-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added this patch to the patch series.

Changes v2 -> v3:
  - None.

 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 66e1b88f16..dcd3fd255e 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,7 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.6 or any later)
+** +python+ (version 2.7 or any later)
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
-- 
2.19.2

From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 15 Dec 2018 15:54:07 -0500
Subject: [Buildroot] [PATCH v2 2/2] prerequisite.txt: Bump python dependency
 to 2.7
In-Reply-To: <20181215205407.78688-1-aduskett@gmail.com>
References: <20181215205407.78688-1-aduskett@gmail.com>
Message-ID: <20181215205407.78688-2-aduskett@gmail.com>
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

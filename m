From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 4 Oct 2015 17:24:29 +0100
Subject: [Buildroot] [PATCH] devmem2: add a hash file
Message-ID: <1443975869-25566-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/devmem2/devmem2.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/devmem2/devmem2.hash

diff --git a/package/devmem2/devmem2.hash b/package/devmem2/devmem2.hash
new file mode 100644
index 0000000..fff5306
--- /dev/null
+++ b/package/devmem2/devmem2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639  devmem2.c
-- 
1.7.1

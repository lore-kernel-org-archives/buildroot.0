From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu,  5 Mar 2015 11:21:00 +0100
Subject: [Buildroot] [PATCH v2] autoconf-archive: add hash
Message-ID: <1425550860-3912-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/autoconf-archive/autoconf-archive.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/autoconf-archive/autoconf-archive.hash

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
new file mode 100644
index 0000000..9f975d5
--- /dev/null
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 dfd460d23a9690322dee29a355ea285b5774f37383d3741cf77a4ad6a11a7e81  autoconf-archive-2015.02.04.tar.xz
-- 
2.1.4

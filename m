From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Dec 2015 09:46:29 +0100
Subject: [Buildroot] [PATCH] libsoc: add a hash file
Message-ID: <1449737189-25758-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsoc/libsoc.hash

diff --git a/package/libsoc/libsoc.hash b/package/libsoc/libsoc.hash
new file mode 100644
index 0000000..e6a8577
--- /dev/null
+++ b/package/libsoc/libsoc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fc7f4c4ec5cc694833f27d91603aaaa6a43e8100ab26bac47f553753c8d45ac0  libsoc-0.7.1.tar.gz
-- 
2.1.4

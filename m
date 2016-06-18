From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:29 +0200
Subject: [Buildroot] [PATCH 07/11] package/opencv3: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-7-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the opencv3 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/opencv3/opencv3.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/opencv3/opencv3.hash

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
new file mode 100644
index 0000000..20859ea
--- /dev/null
+++ b/package/opencv3/opencv3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f00b3c4f42acda07d89031a2ebb5ebe390764a133502c03a511f67b78bbd4fbf  opencv3-3.1.0.tar.gz
-- 
2.5.5

From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:24 +0200
Subject: [Buildroot] [PATCH 02/11] package/mraa: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the mraa tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mraa/mraa.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mraa/mraa.hash

diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
new file mode 100644
index 0000000..cbd70a4
--- /dev/null
+++ b/package/mraa/mraa.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-v0.9.1.tar.gz
-- 
2.5.5

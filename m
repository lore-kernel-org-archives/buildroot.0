From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:27 +0200
Subject: [Buildroot] [PATCH 05/11] package/ne10: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the ne10 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ne10/ne10.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ne10/ne10.hash

diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
new file mode 100644
index 0000000..db5b6f1
--- /dev/null
+++ b/package/ne10/ne10.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-v1.2.0.tar.gz
-- 
2.5.5

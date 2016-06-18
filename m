From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:30 +0200
Subject: [Buildroot] [PATCH 08/11] package/pifmrds: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-8-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the pifmrds tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/pifmrds/pifmrds.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pifmrds/pifmrds.hash

diff --git a/package/pifmrds/pifmrds.hash b/package/pifmrds/pifmrds.hash
new file mode 100644
index 0000000..0c91d3d
--- /dev/null
+++ b/package/pifmrds/pifmrds.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2afc9f3c9fc206ba32865d7dd77f3a97d7d86dcfc9b44eeb5665e8fddaafcf44  pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.tar.gz
-- 
2.5.5

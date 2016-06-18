From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:25 +0200
Subject: [Buildroot] [PATCH 03/11] package/mrouted: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the mrouted tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mrouted/mrouted.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mrouted/mrouted.hash

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
new file mode 100644
index 0000000..d5069e5
--- /dev/null
+++ b/package/mrouted/mrouted.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 181908f7025c5a2dee2e50d86888780469eaa9e1bd42d3eca9dfed8274aecd3d  mrouted-3.9.7.tar.gz
-- 
2.5.5

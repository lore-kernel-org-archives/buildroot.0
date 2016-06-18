From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:02 +0200
Subject: [Buildroot] [PATCH 02/19] package/bandwidthd: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the bandwidthd tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/bandwidthd/bandwidthd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bandwidthd/bandwidthd.hash

diff --git a/package/bandwidthd/bandwidthd.hash b/package/bandwidthd/bandwidthd.hash
new file mode 100644
index 0000000..248f9ff
--- /dev/null
+++ b/package/bandwidthd/bandwidthd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-v2.0.1-auto-r11.tar.gz
-- 
2.5.5

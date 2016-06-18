From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:11 +0200
Subject: [Buildroot] [PATCH 11/19] package/snappy: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-11-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the snappy tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/snappy/snappy.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/snappy/snappy.hash

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
new file mode 100644
index 0000000..fc979ae
--- /dev/null
+++ b/package/snappy/snappy.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d64e434e2ddfe9ae942708747003d489e27f2bfddaa5e9e070da98cb00f660f2  snappy-1ff9be9b8fafc8528ca9e055646f5932aa5db9c4.tar.gz
-- 
2.5.5

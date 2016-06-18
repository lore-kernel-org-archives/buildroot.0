From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:10 +0200
Subject: [Buildroot] [PATCH 10/19] package/leveldb: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-10-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the leveldb tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/leveldb/leveldb.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/leveldb/leveldb.hash

diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
new file mode 100644
index 0000000..1f83e6e
--- /dev/null
+++ b/package/leveldb/leveldb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4aa1a7479bc567b95a59ac6fb79eba49f61884d6fd400f20b7af147d54c5cee5  leveldb-v1.18.tar.gz
-- 
2.5.5

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:53:13 +0200
Subject: [Buildroot] [git commit] package/leveldb: add .hash file
Message-ID: <20160618205843.59C707FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21a086fa4468c171bbd2251de2ca45cc9254cc97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the leveldb tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leveldb/leveldb.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
new file mode 100644
index 0000000..1f83e6e
--- /dev/null
+++ b/package/leveldb/leveldb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4aa1a7479bc567b95a59ac6fb79eba49f61884d6fd400f20b7af147d54c5cee5  leveldb-v1.18.tar.gz

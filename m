From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:55:38 +0200
Subject: [Buildroot] [git commit] package/libpam-tacplus: add .hash file
Message-ID: <20160618205843.996BE7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e7bb966d2ff18ff026c1581e442f84c18d19341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libpam-tacplus tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpam-tacplus/libpam-tacplus.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
new file mode 100644
index 0000000..c8a7723
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 747f7ad980a3726ed3abc5fec92e867efa8af8c53caac547cab7eb6af5ce0edf  libpam-tacplus-1.3.9.tar.gz

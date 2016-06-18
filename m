From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:13:21 +0200
Subject: [Buildroot] [git commit] package/neardal: add .hash file
Message-ID: <20160618211721.75EE1805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a068fdce16a935150d0fcfdd0e912c2dca1d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the neardal tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/neardal/neardal.hash b/package/neardal/neardal.hash
new file mode 100644
index 0000000..c767a74
--- /dev/null
+++ b/package/neardal/neardal.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9955753759a2604fa47562a4bbccd3b787d625e70311bb6662936d89d26715b7  neardal-33b54a55032b047fd885a5eb3592c169c0056c49.tar.gz

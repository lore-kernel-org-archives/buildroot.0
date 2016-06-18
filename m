From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:14:57 +0200
Subject: [Buildroot] [git commit] package/qdecoder: add .hash file
Message-ID: <20160618211721.BE215805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a2152beb60fc0be3ad7fbd73c5c870702b84db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the qdecoder tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
new file mode 100644
index 0000000..6b30310
--- /dev/null
+++ b/package/qdecoder/qdecoder.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 641d3df4895626d7a530c5d26724e9b5887e9845d4b47f42c1cbce4a17ebf6af  qdecoder-r12.0.5.tar.gz

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:51:26 +0200
Subject: [Buildroot] [git commit] sl: add .hash file
Message-ID: <20160615205241.0A75580406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f58fb22e3be3e11686717a1ce38270e0c5a97b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/22e/22e78cfb88f2fc6f6f8b7a0afafbb5eb101bb982/

Similar to jquery-keyboard, it seems the sl tarball on the autobuilder is
corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sl/sl.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sl/sl.hash b/package/sl/sl.hash
new file mode 100644
index 0000000..be74670
--- /dev/null
+++ b/package/sl/sl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1e5996757f879c81f202a18ad8e982195cf51c41727d3fea4af01fdcbbb5563a  sl-5.02.tar.gz

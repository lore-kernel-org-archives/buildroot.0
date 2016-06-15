From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:26:02 +0200
Subject: [Buildroot] [git commit] libatomic_ops: : add .hash file
Message-ID: <20160615202712.64EB181D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f791ab09d015a04d73153d0e0507b593b384246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/a45/a459be0bf948c3d5db6d5ab7cd9a1a89edd692a2/
http://autobuild.buildroot.org/results/866/866b35878b03e0046b18285dcff89e164a658237/

Similar to jquery-keyboard, it seems the libatomic_ops tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libatomic_ops/libatomic_ops.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
new file mode 100644
index 0000000..d91f705
--- /dev/null
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2616be0a2f70f7e3eb12f131a36e32723ed5a1928f17b886c3e7c62f7ed14339  libatomic_ops-libatomic_ops-7_4_2.tar.gz

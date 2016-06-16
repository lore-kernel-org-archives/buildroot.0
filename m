From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:46:31 +0200
Subject: [Buildroot] [git commit] pps-tools: add .hash file
Message-ID: <20160616204727.C4131817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e398c23b4cb7552ef7dcbcaa4eee4b3178dc3589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/006/00648b4ca73116933a44cccef3dbefbd16766246/

Similar to jquery-keyboard, it seems the pps-tools tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pps-tools/pps-tools.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
new file mode 100644
index 0000000..9fa62cb
--- /dev/null
+++ b/package/pps-tools/pps-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 28d4e5aa845f659a6ab4174bbf579e22e2d2c87dc72fd6d07306a6a249c27c76  pps-tools-0deb9c7e135e9380a6d09e9d2e938a146bb698c8.tar.gz

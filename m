From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:01:39 +0200
Subject: [Buildroot] [git commit] snowball-init: add .hash file
Message-ID: <20160615210143.CC4B680AC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6da2a18d8f1a58bd491277e502975c53017fa88d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/fba/fba69e25de9463282094bcd9b18b63ba6de0a892/

Similar to jquery-keyboard, it seems the snowball-init tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snowball-init/snowball-init.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/snowball-init/snowball-init.hash b/package/snowball-init/snowball-init.hash
new file mode 100644
index 0000000..f048ab7
--- /dev/null
+++ b/package/snowball-init/snowball-init.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7adafa3e91cae286e18c062acc1b1d0676ac7352e7dedef9dc6106f905433106  snowball-init-b064be21de25729039e5e54037bbdd2e25cfd5b7.tar.gz

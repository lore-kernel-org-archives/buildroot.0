From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:20:40 +0200
Subject: [Buildroot] [git commit] libsha1: add .hash file
Message-ID: <20160616202131.EC6528210B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=572c58bdec623b1b338d8b18f312c7126d345411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e6d/e6d539a2c47428d1af2529069297af1279c8345f/

Similar to jquery-keyboard, it seems the libsha1 tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsha1/libsha1.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsha1/libsha1.hash b/package/libsha1/libsha1.hash
new file mode 100644
index 0000000..6d597ab
--- /dev/null
+++ b/package/libsha1/libsha1.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ef4c75007ac41c3dc09e0225943c789ba2b9c632a6cd7b548e0519477ac2f768  libsha1-0.3.tar.gz

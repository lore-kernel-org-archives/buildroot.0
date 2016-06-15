From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 21:55:25 +0200
Subject: [Buildroot] [git commit] explorercanvas: add .hash file
Message-ID: <20160615195633.E1B048081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=994e427caea1dc4b352fc9720387835440e47b09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/51c/51ca42d031814e7d6650701ea285cb7e1f31bcea/
http://autobuild.buildroot.org/results/dc5/dc55e5f210c90dbaa4bb051bf489c53c18462828/

Similar to jquery-keyboard, it seems the explorercanvas tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/explorercanvas/explorercanvas.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/explorercanvas/explorercanvas.hash b/package/explorercanvas/explorercanvas.hash
new file mode 100644
index 0000000..59e8c7a
--- /dev/null
+++ b/package/explorercanvas/explorercanvas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7b8f597b5d3a2f71e87aac413e12e03d852df3dd3ac39f70e1615c9c850217ec  explorercanvas-aa989ea9d9bac748638f7c66b0fc88e619715da6.tar.gz

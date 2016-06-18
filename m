From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:51:54 +0200
Subject: [Buildroot] [git commit] package/json-javascript: add .hash file
Message-ID: <20160618205843.3642881976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4386dd4321c3747081e3fb3d429f1bdfba7f6069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the json-javascript tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-javascript/json-javascript.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-javascript/json-javascript.hash b/package/json-javascript/json-javascript.hash
new file mode 100644
index 0000000..6216445
--- /dev/null
+++ b/package/json-javascript/json-javascript.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz

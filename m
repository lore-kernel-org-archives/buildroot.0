From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:57:38 +0200
Subject: [Buildroot] [git commit] package/libcrossguid: add .hash file
Message-ID: <20160618205843.E60337FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bd0b22a18c2295d4a6b2a540c5630bd76e97195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libcrossguid tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcrossguid/libcrossguid.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
new file mode 100644
index 0000000..a991da5
--- /dev/null
+++ b/package/libcrossguid/libcrossguid.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2015 22:56:09 +0200
Subject: [Buildroot] [git commit] package/xfsprogs: add hash file
Message-ID: <20150607221446.60E6880824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfecdaa5098a385bfc6fb5fb9e5dc5e85e3bc2a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/xfsprogs.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
new file mode 100644
index 0000000..3fb02df
--- /dev/null
+++ b/package/xfsprogs/xfsprogs.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature:
+#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-3.1.11.tar.gz.sig
+sha256 adf4980177b5c890c1ca86b9c0e3e4d69a3f95bfc01746844280c2393cf4d6be xfsprogs-3.1.11.tar.gz

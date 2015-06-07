From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2015 22:46:55 +0200
Subject: [Buildroot] [git commit] package/libsvg: add hash file
Message-ID: <20150607221446.447288082E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f638d12678e1600a9020b9af1aaa962682b15267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsvg/libsvg.hash |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libsvg/libsvg.hash b/package/libsvg/libsvg.hash
new file mode 100644
index 0000000..c500849
--- /dev/null
+++ b/package/libsvg/libsvg.hash
@@ -0,0 +1,5 @@
+# From http://cairographics.org/snapshots/libsvg-0.1.4.tar.gz.md5
+md5 ce0715e3013f78506795fba16e8455d3 libsvg-0.1.4.tar.gz
+
+# Locally calculated
+sha256 4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f libsvg-0.1.4.tar.gz

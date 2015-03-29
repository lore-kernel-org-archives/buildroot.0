From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:18:19 +0200
Subject: [Buildroot] [git commit] package/ccache: add hash file
Message-ID: <20150329131843.D62BB8040E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0fe88ea2aa146b64752ab82e7eb6d7d476e6b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
new file mode 100644
index 0000000..10caac8
--- /dev/null
+++ b/package/ccache/ccache.hash
@@ -0,0 +1,2 @@
+# Verified key http://samba.org/ftp/ccache/ccache-3.1.11.tar.xz.asc - sha256 computed locally
+sha256	60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e	ccache-3.1.11.tar.xz

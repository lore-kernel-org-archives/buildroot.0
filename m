From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  7 Jun 2015 11:37:16 +0200
Subject: [Buildroot] [PATCH 3/6] package/libsvg: add hash file
In-Reply-To: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1433669839-21599-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libsvg/libsvg.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 package/libsvg/libsvg.hash

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
-- 
2.4.2

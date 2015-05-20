From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:26 +0200
Subject: [Buildroot] [PATCH 7/7] package/unionfs: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/unionfs/unionfs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/unionfs/unionfs.hash

diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
new file mode 100644
index 0000000..2cadf0f
--- /dev/null
+++ b/package/unionfs/unionfs.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662 unionfs-fuse-0.26.tar.xz
-- 
2.4.1

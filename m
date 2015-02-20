From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Feb 2015 14:24:02 -0300
Subject: [Buildroot] [PATCH 2/2] exfat: add hash
In-Reply-To: <1424453042-10412-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424453042-10412-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424453042-10412-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat/exfat.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/exfat/exfat.hash

diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
new file mode 100644
index 0000000..bfaca6e
--- /dev/null
+++ b/package/exfat/exfat.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
+sha1	060560f74dbce4dc947c7e658e75fdf339bc10ff	fuse-exfat-1.1.0.tar.gz
-- 
2.0.5

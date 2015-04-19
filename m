From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:26 +0200
Subject: [Buildroot] [PATCH 07/19] package/ghostscript-fonts: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ghostscript-fonts/ghostscript-fonts.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ghostscript-fonts/ghostscript-fonts.hash

diff --git a/package/ghostscript-fonts/ghostscript-fonts.hash b/package/ghostscript-fonts/ghostscript-fonts.hash
new file mode 100644
index 0000000..e9c7fdf
--- /dev/null
+++ b/package/ghostscript-fonts/ghostscript-fonts.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/gs-fonts/files/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/
+sha1	2a7198e8178b2e7dba87cb5794da515200b568f5	ghostscript-fonts-std-8.11.tar.gz
-- 
1.7.10.4

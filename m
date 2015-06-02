From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  2 Jun 2015 12:26:28 +0200
Subject: [Buildroot] [PATCH 3/3] package/mtd: add hash file
In-Reply-To: <1433240788-14191-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433240788-14191-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1433240788-14191-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/mtd/mtd.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/mtd/mtd.hash

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
new file mode 100644
index 0000000..79b90ae
--- /dev/null
+++ b/package/mtd/mtd.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.1.tar.bz2.asc
+sha256 3b2ed1d05f73bd3789a85bebf5072874a72f8daf63552fd44a94e2a9acf1620b mtd-utils-1.5.1.tar.bz2
-- 
2.4.1

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:39:55 +0200
Subject: [Buildroot] [PATCH 02/12] package/can-utils: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/can-utils/can-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/can-utils/can-utils.hash

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
new file mode 100644
index 0000000..09e3c4d
--- /dev/null
+++ b/package/can-utils/can-utils.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 8db112e69fceef16617895fa9d4222221fdf44c19eef64912480336c59904765 can-utils-b70a76670dbe8925c2a7c75f90d36a28a8878d7a.tar.gz
-- 
2.8.1

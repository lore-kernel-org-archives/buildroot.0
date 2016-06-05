From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:40:02 +0200
Subject: [Buildroot] [PATCH 09/12] package/softether: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/softether.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/softether/softether.hash

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
new file mode 100644
index 0000000..961990b
--- /dev/null
+++ b/package/softether/softether.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
-- 
2.8.1

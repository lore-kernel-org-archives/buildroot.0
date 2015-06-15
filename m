From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Jun 2015 07:12:29 +0300
Subject: [Buildroot] [PATCH] mxml: add hash file
Message-ID: <f9e34cbf0944f4f66858c0ec4b4e3d0aa56548eb.1434341549.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mxml/mxml.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/mxml/mxml.hash

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
new file mode 100644
index 000000000000..310e2cae0ad5
--- /dev/null
+++ b/package/mxml/mxml.hash
@@ -0,0 +1,4 @@
+# From http://www.msweet.org/downloads.php?L+Z3
+md5 e21cad0f7aacd18f942aa0568a8dee19 mxml-2.9.tar.gz
+# Locally computed
+sha256 cded54653c584b24c4a78a7fa1b3b4377d49ac4f451ddf170ebbc8161d85ff92 mxml-2.9.tar.gz
-- 
2.1.4

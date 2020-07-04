From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  3 Jul 2020 22:05:33 -0300
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
Message-ID: <20200704010533.1854-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/dvb-apps/dvb-apps.hash | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 package/dvb-apps/dvb-apps.hash

diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
new file mode 100644
index 000000000000..a618cd7765d3
--- /dev/null
+++ b/package/dvb-apps/dvb-apps.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
+
+# Hash for license files:
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
-- 
2.17.1

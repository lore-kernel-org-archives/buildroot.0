From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 21:57:07 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/dvb-apps: add
 hash file
Message-ID: <20200720195318.0CB498636F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9200a37956d2ce580cdfdcfca8eabccb7d6470b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aaf689903c1e7e874664063b7c828c1c13a79b6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/dvb-apps.hash | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
new file mode 100644
index 0000000000..d394ced131
--- /dev/null
+++ b/package/dvb-apps/dvb-apps.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
+
+# Hash for license files:
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL

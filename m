From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:27 +0200
Subject: [Buildroot] [PATCH 18/28] package/uemacs: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/uemacs/uemacs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/uemacs/uemacs.hash

diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
new file mode 100644
index 000000000..a88be88b5
--- /dev/null
+++ b/package/uemacs/uemacs.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c6772ccb519f89731ac927c6bd229617fa4a488b966251e9147a03f998c39960  uemacs-8841922689769960fa074fbb053cb8507f2f3ed9.tar.gz
-- 
2.11.0

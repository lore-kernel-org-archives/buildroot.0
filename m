From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:39:56 +0200
Subject: [Buildroot] [PATCH 03/12] package/glmark2: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glmark2/glmark2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/glmark2/glmark2.hash

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
new file mode 100644
index 0000000..7868b37
--- /dev/null
+++ b/package/glmark2/glmark2.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 421bdb87ed8c04a25f60816c7754d45e91a45136f5489df59d74001c159882b8 glmark2-fa71af2dfab711fac87b9504b6fc9862f44bf72a.tar.gz
-- 
2.8.1

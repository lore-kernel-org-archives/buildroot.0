From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:39:58 +0200
Subject: [Buildroot] [PATCH 05/12] package/janus-gateway: add hash
In-Reply-To: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465162805-13367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465162805-13367-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/janus-gateway/janus-gateway.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/janus-gateway/janus-gateway.hash

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
new file mode 100644
index 0000000..fece97a
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4d341a54d3eae5506c3e2409f4a6e4f5159dc4ece3197aaf077d3eb997e69a10 janus-gateway-v0.1.0.tar.gz
-- 
2.8.1

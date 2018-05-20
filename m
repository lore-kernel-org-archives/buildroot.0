From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:37:22 +0200
Subject: [Buildroot] [PATCH 1/1] libmodplug: add hash for license file
Message-ID: <20180520083722.7843-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodplug/libmodplug.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
index 0077e26ccd..d50a56eeda 100644
--- a/package/libmodplug/libmodplug.hash
+++ b/package/libmodplug/libmodplug.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad  libmodplug-0.8.8.5.tar.gz
+sha256  49942e7b3b175f549e751feb08b5270ca6f6c5fb7a1be9f9517db275ec32c92e  COPYING
-- 
2.14.1

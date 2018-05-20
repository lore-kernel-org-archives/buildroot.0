From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 16:31:12 +0200
Subject: [Buildroot] [PATCH 1/1] libpcap: add hash for license file
Message-ID: <20180520143112.13607-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 6894046aff..f8bc1bcfef 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e	libpcap-1.8.1.tar.gz
+
+# Hash for license file:
+sha256	8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd	LICENSE
-- 
2.14.1

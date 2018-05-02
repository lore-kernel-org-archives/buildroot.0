From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 21:45:29 +0200
Subject: [Buildroot] [PATCH 1/1] libkrb5: add hash for license file
Message-ID: <20180502194529.22459-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 59552d7fd4..e9fb0a2ace 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08	krb5-1.16.tar.gz
+
+# Hash for license file:
+sha256	0b10e357b1adb953b2865dddfab73f95591b3f7c90aa39a8a087c558b1427e51	NOTICE
-- 
2.14.1

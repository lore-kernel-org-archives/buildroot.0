From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 14:54:58 +0200
Subject: [Buildroot] [PATCH 1/1] libgsm: add hash for license file
Message-ID: <20180430125458.14606-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgsm/libgsm.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index a73359d653..523e629dc4 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  855a57d1694941ddf3c73cb79b8d0b3891e9c9e7870b4981613b734e1ad07601  gsm-1.0.17.tar.gz
+sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
-- 
2.14.1

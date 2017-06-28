From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 28 Jun 2017 11:55:53 +0100
Subject: [Buildroot] [PATCH] mosquitto: specify that hash is taken from
	upstream
Message-ID: <20170628105553.32339-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 6c102ebaa..3f766307d 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
-# Locally computed:
+# From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.12.tar.gz
 sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
-- 
2.13.0

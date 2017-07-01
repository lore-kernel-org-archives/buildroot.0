From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:45:44 +0200
Subject: [Buildroot] [git commit] mosquitto: specify that hash is taken from
	upstream
Message-ID: <20170701154243.CFD3381841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8dc97ee5ed10c75666e500b6752497690ea6853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 82bf5c6..60538f4 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,3 +1,3 @@
-# Locally computed:
+# From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.12.tar.gz
 sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
 sha256  06abd1206e548ac2378dd96f5434cb3e40ed77cecb6a9c37fbabab0b0f1360e5  mosquitto-1.4.x_cve-2017-9868.patch

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 15:19:55 +0200
Subject: [Buildroot] [git commit] mosquitto: clarify that patch hash is
	locally calculated
Message-ID: <20170702131907.53FB77FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ef8c2239339f52e35572e485db306df9012d500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e51d69a3b (mosquitto: specify that hash is taken from upstream)
changed the .hash description header, but the upstream hash only applies
to the tarball, not the patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 60538f4..4ef1743 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,3 +1,4 @@
 # From http://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.12.tar.gz
 sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
+# Locally computed:
 sha256  06abd1206e548ac2378dd96f5434cb3e40ed77cecb6a9c37fbabab0b0f1360e5  mosquitto-1.4.x_cve-2017-9868.patch

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:05:24 +0200
Subject: [Buildroot] [git commit] libkrb5: add hash for license file
Message-ID: <20180503200602.7711B8B54D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f5d2c99a9515d1bbc8beb25ddcc8e744d53c7c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu,  6 Jun 2019 22:24:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/nanomsg: fix legal-info failure
Message-ID: <1559852666-19259-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After version bump, the sha256 has been updated
while the COPYING file remains unchanged.

Fixes:
 - http://autobuild.buildroot.net/results/ec1cb0216ebedc5c7bd2c8719460db28b666a24f/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Now make legal-info is OK: 
  -> COPYING: OK (sha256: 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a)

 package/nanomsg/nanomsg.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index ed67a7e..062ac9f 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -2,4 +2,4 @@
 sha256 218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
 
 # Hash for license file:
-sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
+sha256 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
-- 
2.7.4

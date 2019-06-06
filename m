From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 23:50:48 +0200
Subject: [Buildroot] [git commit] package/nanomsg: fix legal-info failure
Message-ID: <20190606220726.97593810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0019aefe9aeb827becd52be15fe16b1d687d3be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After version bump, the sha256 has been updated
while the COPYING file remains unchanged.

Fixes:
 - http://autobuild.buildroot.net/results/ec1cb0216ebedc5c7bd2c8719460db28b666a24f/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nanomsg/nanomsg.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index ed67a7e3ff..062ac9f6fb 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -2,4 +2,4 @@
 sha256 218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
 
 # Hash for license file:
-sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
+sha256 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING

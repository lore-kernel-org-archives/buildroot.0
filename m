From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2020 17:38:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: add hash for license file
Message-ID: <20201107163844.1354286-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file and update indentation (two spaces).

Fixes:
http://autobuild.buildroot.net/results/b07/b07052de34ca24d5c62f6facec2ced5e092d26e2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinyproxy/tinyproxy.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
index 099c974881..8096741597 100644
--- a/package/tinyproxy/tinyproxy.hash
+++ b/package/tinyproxy/tinyproxy.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 a23a8f647f622f01e51b93fa882ea5a15c20e026d45c3aafa81ec579e464daf7 tinyproxy-1.10.0.tar.bz2
+sha256  a23a8f647f622f01e51b93fa882ea5a15c20e026d45c3aafa81ec579e464daf7  tinyproxy-1.10.0.tar.bz2
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-- 
2.27.0

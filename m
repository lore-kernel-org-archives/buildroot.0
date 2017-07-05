From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:07:21 +0200
Subject: [Buildroot] [git commit] nanomsg: add hash for license file
Message-ID: <20170705200929.5BEE77FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd0d3d1df614f50a080aa10960b7175f2981452f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nanomsg/nanomsg.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index 5f947da..5164a75 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,2 +1,5 @@
 # Locally computed
 sha256 24afdeb71b2e362e8a003a7ecc906e1b84fd9f56ce15ec567481d1bb33132cc7  nanomsg-1.0.0.tar.gz
+
+# Hash for license file:
+sha256 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING

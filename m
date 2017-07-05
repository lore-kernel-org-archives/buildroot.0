From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:02:02 +0200
Subject: [Buildroot] [git commit] glog: add hash for license file
Message-ID: <20170705200928.D1C3E81F11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ddfbfb62800027a7ff4a403a23a3b7708a5b289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glog/glog.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 6f1efdb..909e072 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,2 +1,5 @@
 # Locally computed
 sha256 7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0  glog-v0.3.5.tar.gz
+
+# Hash for License file:
+sha256 0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING

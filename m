From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:21 +0530
Subject: [Buildroot] [PATCH 1/7] glog: add hash for license file
Message-ID: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
-- 
2.7.4

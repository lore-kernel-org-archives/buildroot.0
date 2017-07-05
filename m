From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:26 +0530
Subject: [Buildroot] [PATCH 6/7] nanomsg: add hash for license file
In-Reply-To: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1499266527-11091-6-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
-- 
2.7.4

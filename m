From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:55:59 -0300
Subject: [Buildroot] [PATCH 1/2] hostapd: add hash
Message-ID: <1413284160-20587-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/hostapd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/hostapd/hostapd.hash

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
new file mode 100644
index 0000000..5aefa14
--- /dev/null
+++ b/package/hostapd/hostapd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c94c2b76876fad4c80a1063a06f958a2189ba5003475016fa7658a1ca49bb4df	hostapd-2.3.tar.gz
-- 
2.0.4

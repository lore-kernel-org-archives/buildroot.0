From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:33 -0300
Subject: [Buildroot] [PATCH 032/113] libmbus: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-32-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmbus/libmbus.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libmbus/libmbus.hash

diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
new file mode 100644
index 0000000..faf6a27
--- /dev/null
+++ b/package/libmbus/libmbus.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4	libmbus-0.8.0.tar.gz
-- 
2.3.6

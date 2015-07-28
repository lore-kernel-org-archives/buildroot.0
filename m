From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:46 -0300
Subject: [Buildroot] [PATCH 105/113] ussp-push: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-105-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ussp-push/ussp-push.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ussp-push/ussp-push.hash

diff --git a/package/ussp-push/ussp-push.hash b/package/ussp-push/ussp-push.hash
new file mode 100644
index 0000000..91afb9d
--- /dev/null
+++ b/package/ussp-push/ussp-push.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd	ussp-push-0.11.tar.gz
-- 
2.3.6

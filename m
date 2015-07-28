From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:50 -0300
Subject: [Buildroot] [PATCH 049/113] lite: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-49-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/linphone.hash | 2 ++
 package/lite/lite.hash         | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 package/linphone/linphone.hash
 create mode 100644 package/lite/lite.hash

diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
new file mode 100644
index 0000000..9ed9d37
--- /dev/null
+++ b/package/linphone/linphone.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0	linphone-3.6.1.tar.gz
diff --git a/package/lite/lite.hash b/package/lite/lite.hash
new file mode 100644
index 0000000..9da6b4b
--- /dev/null
+++ b/package/lite/lite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1b784cf595c3d5313e3705db210119f77d48826dbc7fcf6328af83a1270c2264	LiTE-0.8.10.tar.gz
-- 
2.3.6

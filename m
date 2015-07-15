From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:28 -0300
Subject: [Buildroot] [PATCH 37/40] fping: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-37-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fping/fping.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fping/fping.hash

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
new file mode 100644
index 0000000..65e25c7
--- /dev/null
+++ b/package/fping/fping.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	cd47e842f32fe6aa72369d8a0e3545f7c137bb019e66f47379dc70febad357d8	fping-3.10.tar.gz
-- 
2.3.6

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:31 -0300
Subject: [Buildroot] [PATCH 030/113] liblinear: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-30-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liblinear/liblinear.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/liblinear/liblinear.hash

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
new file mode 100644
index 0000000..8a335cc
--- /dev/null
+++ b/package/liblinear/liblinear.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	0ab97ca81c62457fcfe78f56619a7b2f70c1f7c875b4101827343555b4f6c3f4	liblinear-1.96.tar.gz
-- 
2.3.6

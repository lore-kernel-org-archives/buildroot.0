From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:24 -0300
Subject: [Buildroot] [PATCH 023/113] leafpad: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/leafpad/leafpad.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/leafpad/leafpad.hash

diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
new file mode 100644
index 0000000..5c4cd78
--- /dev/null
+++ b/package/leafpad/leafpad.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	a047d2f82fb88b361ae7f382b4cae8ce1a30bef5ead503a68ae886d19be5fec0	leafpad-0.8.18.tar.gz
-- 
2.3.6

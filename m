From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:54 -0300
Subject: [Buildroot] [PATCH 03/40] udisks: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/udisks/udisks.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/udisks/udisks.hash

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
new file mode 100644
index 0000000..5debfd5
--- /dev/null
+++ b/package/udisks/udisks.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5	udisks-1.0.4.tar.gz
-- 
2.3.6

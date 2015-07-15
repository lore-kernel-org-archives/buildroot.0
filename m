From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:30 -0300
Subject: [Buildroot] [PATCH 39/40] fbset: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-39-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbset/fbset.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fbset/fbset.hash

diff --git a/package/fbset/fbset.hash b/package/fbset/fbset.hash
new file mode 100644
index 0000000..ca8cc6d
--- /dev/null
+++ b/package/fbset/fbset.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	40ff4ab0247b75138a0887ed40f81c1a6184f340b77126c16d074b1075b41c20	fbset-2.1.tar.gz
-- 
2.3.6

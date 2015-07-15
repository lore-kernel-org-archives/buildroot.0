From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:31 -0300
Subject: [Buildroot] [PATCH 40/40] libesmtp: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-40-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libesmtp/libesmtp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libesmtp/libesmtp.hash

diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
new file mode 100644
index 0000000..c9c0fa3
--- /dev/null
+++ b/package/libesmtp/libesmtp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b	libesmtp-1.0.6.tar.bz2
-- 
2.3.6

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:53 -0300
Subject: [Buildroot] [PATCH 02/40] time: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/time/time.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/time/time.hash

diff --git a/package/time/time.hash b/package/time/time.hash
new file mode 100644
index 0000000..6ad8c24
--- /dev/null
+++ b/package/time/time.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e37ea79a253bf85a85ada2f7c632c14e481a5fd262a362f6f4fd58e68601496d	time-1.7.tar.gz
-- 
2.3.6

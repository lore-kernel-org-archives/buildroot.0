From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:51 -0300
Subject: [Buildroot] [PATCH 050/113] log4cxx: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-50-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/log4cxx/log4cxx.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/log4cxx/log4cxx.hash

diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
new file mode 100644
index 0000000..469d99a
--- /dev/null
+++ b/package/log4cxx/log4cxx.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c	apache-log4cxx-0.10.0.tar.gz
-- 
2.3.6

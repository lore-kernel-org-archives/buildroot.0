From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:29 -0300
Subject: [Buildroot] [PATCH 028/113] libfcgi: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-28-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfcgi/libfcgi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libfcgi/libfcgi.hash

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
new file mode 100644
index 0000000..586ff1e
--- /dev/null
+++ b/package/libfcgi/libfcgi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9	fcgi-2.4.0.tar.gz
-- 
2.3.6

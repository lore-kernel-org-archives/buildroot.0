From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 09:55:48 +0200
Subject: [Buildroot] [PATCH 1/2] skeleton: ld.so.conf include
	ld.so.conf.d/*.conf
Message-ID: <1413186949-7006-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 system/skeleton/etc/ld.so.conf | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 system/skeleton/etc/ld.so.conf

diff --git a/system/skeleton/etc/ld.so.conf b/system/skeleton/etc/ld.so.conf
new file mode 100644
index 0000000..83327c0
--- /dev/null
+++ b/system/skeleton/etc/ld.so.conf
@@ -0,0 +1 @@
+include /etc/ld.so.conf.d/*.conf
-- 
1.9.1

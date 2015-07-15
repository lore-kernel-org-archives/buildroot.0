From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:21 -0300
Subject: [Buildroot] [PATCH 30/40] libcap-ng: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-30-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap-ng/libcap-ng.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcap-ng/libcap-ng.hash

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
new file mode 100644
index 0000000..d8dde23
--- /dev/null
+++ b/package/libcap-ng/libcap-ng.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	48a2083276f9820cb92dcb05d001b30733bcbf48c14c230303cac3cd08b45b6b	libcap-ng-0.7.4.tar.gz
-- 
2.3.6

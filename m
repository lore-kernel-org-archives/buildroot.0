From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:57:01 -0300
Subject: [Buildroot] [PATCH 3/5] mpfr: add hash file
In-Reply-To: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284223-20630-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpfr/mpfr.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mpfr/mpfr.hash

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
new file mode 100644
index 0000000..ea18780
--- /dev/null
+++ b/package/mpfr/mpfr.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	399d0f47ef6608cc01d29ed1b99c7faff36d9994c45f36f41ba250147100453b	mpfr-3.1.2.tar.xz
-- 
2.0.4

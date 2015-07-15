From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:57 -0300
Subject: [Buildroot] [PATCH 06/40] spice: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/spice/spice.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/spice/spice.hash

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
new file mode 100644
index 0000000..c4d6319
--- /dev/null
+++ b/package/spice/spice.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	cf063e7df42e331a835529d2f613d8a01f8cb2963e8edaadf73a8d65c46fb387	spice-0.12.4.tar.bz2
-- 
2.3.6

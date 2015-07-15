From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:29 -0300
Subject: [Buildroot] [PATCH 38/40] findutils: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-38-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/findutils/findutils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/findutils/findutils.hash

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
new file mode 100644
index 0000000..66f1fcc
--- /dev/null
+++ b/package/findutils/findutils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a	findutils-4.4.2.tar.gz
-- 
2.3.6

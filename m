From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:58 -0300
Subject: [Buildroot] [PATCH 07/16] screen: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/screen/screen.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/screen/screen.hash

diff --git a/package/screen/screen.hash b/package/screen/screen.hash
new file mode 100644
index 0000000..1b20458
--- /dev/null
+++ b/package/screen/screen.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5468545047e301d2b3579f9d9ce00466d14a7eec95ce806e3834a3d6b0b9b080	screen-4.2.1.tar.gz
-- 
2.0.5

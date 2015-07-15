From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:14 -0300
Subject: [Buildroot] [PATCH 23/40] libsndfile: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsndfile/libsndfile.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsndfile/libsndfile.hash

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
new file mode 100644
index 0000000..a19c262
--- /dev/null
+++ b/package/libsndfile/libsndfile.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	59016dbd326abe7e2366ded5c344c853829bebfd1702ef26a07ef662d6aa4882	libsndfile-1.0.25.tar.gz
-- 
2.3.6

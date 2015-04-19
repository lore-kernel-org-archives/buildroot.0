From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:53:07 +0200
Subject: [Buildroot] [PATCH 04/10] package/libee: add hash
In-Reply-To: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429465993-30357-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libee/libee.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libee/libee.hash

diff --git a/package/libee/libee.hash b/package/libee/libee.hash
new file mode 100644
index 0000000..b70242a
--- /dev/null
+++ b/package/libee/libee.hash
@@ -0,0 +1,2 @@
+# From http://www.libee.org/download/libee-0-4-1/
+md5	7bbf4160876c12db6193c06e2badedb2	libee-0.4.1.tar.gz
-- 
1.7.10.4

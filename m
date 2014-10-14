From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:44 -0300
Subject: [Buildroot] [PATCH 07/16] pptp-linux: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pptp-linux/pptp-linux.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/pptp-linux/pptp-linux.hash

diff --git a/package/pptp-linux/pptp-linux.hash b/package/pptp-linux/pptp-linux.hash
new file mode 100644
index 0000000..839d0bf
--- /dev/null
+++ b/package/pptp-linux/pptp-linux.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.8.0/
+md5	4efce9f263e2c3f38d79d9df222476de	pptp-1.8.0.tar.gz
+sha1	6289953812ac986c7234e83aefb10b5e279dc613	pptp-1.8.0.tar.gz
-- 
2.0.4

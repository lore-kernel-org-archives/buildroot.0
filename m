From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:01 -0300
Subject: [Buildroot] [PATCH 060/113] ncdu: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-60-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncdu/ncdu.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/ncdu/ncdu.hash

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
new file mode 100644
index 0000000..7985c99
--- /dev/null
+++ b/package/ncdu/ncdu.hash
@@ -0,0 +1,3 @@
+# From http://dev.yorhel.nl/download/ncdu-1.9.tar.gz.{md5,sha1}
+md5	93258079db897d28bb8890e2db89b1fb	ncdu-1.9.tar.gz
+sha1	27cb5464b192db8ffdf0a894fe51d29985348eb0	ncdu-1.9.tar.gz
-- 
2.3.6

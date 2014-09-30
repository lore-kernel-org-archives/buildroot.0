From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Sep 2014 20:14:19 -0300
Subject: [Buildroot] [PATCH] lighttpd: add hash file
Message-ID: <1412118859-1160-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lighttpd/lighttpd.hash

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
new file mode 100644
index 0000000..01d3458
--- /dev/null
+++ b/package/lighttpd/lighttpd.hash
@@ -0,0 +1,2 @@
+# From http://www.lighttpd.net/
+sha256	113e9b72ccbd1da5deb0774bf93cf0ca15dc82aad2da0f04e5ab27d37d3f30a3	lighttpd-1.4.35.tar.xz
-- 
2.0.4

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:06 -0300
Subject: [Buildroot] [PATCH 15/16] spawn-fcgi: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/spawn-fcgi/spawn-fcgi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/spawn-fcgi/spawn-fcgi.hash

diff --git a/package/spawn-fcgi/spawn-fcgi.hash b/package/spawn-fcgi/spawn-fcgi.hash
new file mode 100644
index 0000000..c1911e4
--- /dev/null
+++ b/package/spawn-fcgi/spawn-fcgi.hash
@@ -0,0 +1,2 @@
+# From http://redmine.lighttpd.net/news/9
+sha256	a3cfc7c9581b6ddc31084b379c9160323fa345d357ace6cd2d3d3af3593e2873	spawn-fcgi-1.6.4.tar.bz2
-- 
2.0.5

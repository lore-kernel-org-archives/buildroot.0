From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:25 +0200
Subject: [Buildroot] [PATCH 06/19] package/gdbm: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdbm/gdbm.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gdbm/gdbm.hash

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
new file mode 100644
index 0000000..e7d3592
--- /dev/null
+++ b/package/gdbm/gdbm.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnu.org/archive/html/info-gnu/2013-12/msg00012.html
+sha1	ce433d0f192c21d41089458ca5c8294efe9806b4	gdbm-1.11.tar.gz
-- 
1.7.10.4

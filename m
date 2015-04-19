From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:37 +0200
Subject: [Buildroot] [PATCH 18/19] package/iputils: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iputils/iputils.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iputils/iputils.hash

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
new file mode 100644
index 0000000..21a2044
--- /dev/null
+++ b/package/iputils/iputils.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/iputils/files/
+sha1	3e85179746fd93000d6267bd55addfe97f321ba7	iputils-s20121011.tar.bz2
-- 
1.7.10.4

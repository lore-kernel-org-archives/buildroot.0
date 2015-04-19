From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:35 +0200
Subject: [Buildroot] [PATCH 16/19] package/ipmiutil: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ipmiutil/ipmiutil.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ipmiutil/ipmiutil.hash

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
new file mode 100644
index 0000000..2afc0f2
--- /dev/null
+++ b/package/ipmiutil/ipmiutil.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/ipmiutil/files/?source=navbar
+sha1	265f022c876da373b2ecb4be2bc0f98e65f70977	ipmiutil-2.9.5.tar.gz
-- 
1.7.10.4

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:20 +0200
Subject: [Buildroot] [PATCH 5/9] package/elftosb: add hash
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/elftosb/elftosb.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/elftosb/elftosb.hash

diff --git a/package/elftosb/elftosb.hash b/package/elftosb/elftosb.hash
new file mode 100644
index 0000000..2b9f02b
--- /dev/null
+++ b/package/elftosb/elftosb.hash
@@ -0,0 +1,2 @@
+# From http://repository.timesys.com/buildsources/e/elftosb/elftosb-10.12.01/elftosb-10.12.01.tar.gz.md5sum
+md5	e8005d606c1e0bb3507c82f6eceb3056	elftosb-10.12.01.tar.gz
-- 
1.7.10.4

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:14:01 +0200
Subject: [Buildroot] [PATCH 08/10] package/sysvinit: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sysvinit/sysvinit.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/sysvinit/sysvinit.hash

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
new file mode 100644
index 0000000..268b984
--- /dev/null
+++ b/package/sysvinit/sysvinit.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit/sysvinit_2.88dsf-13.1%2Bsqueeze1.dsc
+sha256	b016f937958d2809a020d407e1287bdc09abf1d44efaa96530e2ea57f544f4e8	sysvinit_2.88dsf.orig.tar.gz
+sha256	26b456a31036b1e1c2486c22ca2b7fde6d723b7c63669604eacc61cfb6609ef8	sysvinit_2.88dsf-13.1+squeeze1.diff.gz
-- 
1.7.10.4

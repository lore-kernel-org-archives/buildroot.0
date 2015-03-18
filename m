From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:45:17 -0300
Subject: [Buildroot] [PATCH 08/10] libnfnetlink: add hash file
In-Reply-To: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426675519-21481-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnfnetlink/libnfnetlink.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libnfnetlink/libnfnetlink.hash

diff --git a/package/libnfnetlink/libnfnetlink.hash b/package/libnfnetlink/libnfnetlink.hash
new file mode 100644
index 0000000..93844f2
--- /dev/null
+++ b/package/libnfnetlink/libnfnetlink.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.1.tar.bz2.{md5sum,sha1sum}
+md5	98927583d2016a9fb1936fed992e2c5e	libnfnetlink-1.0.1.tar.bz2
+sha1	27ae2dfbd976e28cb7a417f9e946c901f512dd9a	libnfnetlink-1.0.1.tar.bz2
-- 
2.0.5

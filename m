From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 17:18:10 -0300
Subject: [Buildroot] [PATCHv2] iptables: add hash
Message-ID: <1410985090-7574-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/iptables/iptables.hash

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
new file mode 100644
index 0000000..a813f74
--- /dev/null
+++ b/package/iptables/iptables.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.{md5sum,sha1sum}
+md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
+sha1	85d4160537546a23a7e42bc26dd7ee62a0ede4c8	iptables-1.4.21.tar.bz2
-- 
1.8.5.5

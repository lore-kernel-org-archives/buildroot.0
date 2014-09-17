From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:01 -0300
Subject: [Buildroot] [PATCH 03/11] iptables: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iptables/iptables.hash

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
new file mode 100644
index 0000000..61b9d3d
--- /dev/null
+++ b/package/iptables/iptables.hash
@@ -0,0 +1,2 @@
+# From http://www.netfilter.org/projects/iptables/downloads.html#iptables-1.4.21
+md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
-- 
1.8.5.5

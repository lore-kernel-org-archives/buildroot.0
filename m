From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jul 2015 09:52:29 -0300
Subject: [Buildroot] [PATCH 1/4] netstat-nat: add hash file
Message-ID: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netstat-nat/netstat-nat.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/netstat-nat/netstat-nat.hash

diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
new file mode 100644
index 0000000..924da12
--- /dev/null
+++ b/package/netstat-nat/netstat-nat.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca	netstat-nat-1.4.10.tar.gz
-- 
2.3.6

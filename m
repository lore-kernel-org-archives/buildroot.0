From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:56:59 -0300
Subject: [Buildroot] [PATCH 1/5] openvpn: add hash file
Message-ID: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/openvpn/openvpn.hash

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
new file mode 100644
index 0000000..d13258d
--- /dev/null
+++ b/package/openvpn/openvpn.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1ccd72c99e5c5627a7f7eb826489027dad35ce260b925b49dfc1f90bd24719ee	openvpn-2.3.4.tar.xz
-- 
2.0.4

From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:22 +0200
Subject: [Buildroot] [PATCH 3/7] package/vpnc: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/vpnc/vpnc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/vpnc/vpnc.hash

diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
new file mode 100644
index 0000000..a79df8f
--- /dev/null
+++ b/package/vpnc/vpnc.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 46cea3bd02f207c62c7c6f2f22133382602baeda1dc320747809e94881414884 vpnc-0.5.3.tar.gz
-- 
2.4.1

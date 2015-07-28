From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:19 -0300
Subject: [Buildroot] [PATCH 018/113] ifplugd: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ifplugd/ifplugd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ifplugd/ifplugd.hash

diff --git a/package/ifplugd/ifplugd.hash b/package/ifplugd/ifplugd.hash
new file mode 100644
index 0000000..2977c69
--- /dev/null
+++ b/package/ifplugd/ifplugd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0	ifplugd-0.28.tar.gz
-- 
2.3.6

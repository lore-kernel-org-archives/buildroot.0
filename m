From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:06 -0300
Subject: [Buildroot] [PATCH 065/113] nss-mdns: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-65-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nss-mdns/nss-mdns.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nss-mdns/nss-mdns.hash

diff --git a/package/nss-mdns/nss-mdns.hash b/package/nss-mdns/nss-mdns.hash
new file mode 100644
index 0000000..169c497
--- /dev/null
+++ b/package/nss-mdns/nss-mdns.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d	nss-mdns-0.10.tar.gz
-- 
2.3.6

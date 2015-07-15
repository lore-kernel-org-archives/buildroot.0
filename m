From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:13 -0300
Subject: [Buildroot] [PATCH 22/40] linux-fusion: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-22-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-fusion/linux-fusion.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/linux-fusion/linux-fusion.hash

diff --git a/package/linux-fusion/linux-fusion.hash b/package/linux-fusion/linux-fusion.hash
new file mode 100644
index 0000000..307c522
--- /dev/null
+++ b/package/linux-fusion/linux-fusion.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	96508ab2c27074af6e18474fec23595520379e2256df84c63897fcd9672ee9b1	linux-fusion-9.0.2.tar.gz
-- 
2.3.6

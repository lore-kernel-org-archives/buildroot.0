From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 12 Dec 2018 00:56:38 -0200
Subject: [Buildroot] [PATCH] package/waf: add Config.in.host
Message-ID: <20181212025638.19483-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/Config.in.host     | 1 +
 package/waf/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/waf/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 2211345a7b..cd9dae3a5f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -66,6 +66,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/waf/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
diff --git a/package/waf/Config.in.host b/package/waf/Config.in.host
new file mode 100644
index 0000000000..39d5bb0fe2
--- /dev/null
+++ b/package/waf/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_WAF
+	bool "host waf"
+	help
+	  WAF, the meta build system
+
+	  https://waf.io/
-- 
2.19.2

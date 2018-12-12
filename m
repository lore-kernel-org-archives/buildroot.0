From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 12 Dec 2018 00:56:04 -0200
Subject: [Buildroot] [PATCH 1/2] package/cryptopp: add Config.in.host
Message-ID: <20181212025605.19382-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/Config.in.host          | 1 +
 package/cryptopp/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/cryptopp/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 76e619b13e..2211345a7b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -9,6 +9,7 @@ menu "Host utilities"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/cryptopp/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/cryptopp/Config.in.host b/package/cryptopp/Config.in.host
new file mode 100644
index 0000000000..03170cbcf1
--- /dev/null
+++ b/package/cryptopp/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_CRYPTOPP
+	bool "host cryptopp"
+	help
+	  A free C++ class library of cryptographic schemes
+
+	  https://www.cryptopp.com/
-- 
2.19.2

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 16:52:27 +0200
Subject: [Buildroot] [PATCH] package/dacapo: fix indentation
Message-ID: <20190414145227.17968-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes errors reported by running 'make check-package':
    package/dacapo/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/dacapo/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/dacapo/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/dacapo/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/dacapo/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/dacapo/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/dacapo/Config.in:12: should be indented with one tab (http://nightly.buildroot.org/#_config_files)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Daniel J. Leach <dleach@belcan.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dacapo/Config.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/dacapo/Config.in b/package/dacapo/Config.in
index 802d7620e8..02dcab9e72 100644
--- a/package/dacapo/Config.in
+++ b/package/dacapo/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_DACAPO
-       bool "dacapo"
-       depends on BR2_PACKAGE_OPENJDK
-       help
-         The DaCapo benchmark suite is intended as a tool for Java
-         benchmarking by the programming language, memory
-         management and computer architecture communities.
+	bool "dacapo"
+	depends on BR2_PACKAGE_OPENJDK
+	help
+	  The DaCapo benchmark suite is intended as a tool for Java
+	  benchmarking by the programming language, memory
+	  management and computer architecture communities.
 
-         http://dacapobench.org/
+	  http://dacapobench.org/
 
 comment "dacapo needs OpenJDK"
-       depends on !BR2_PACKAGE_OPENJDK
+	depends on !BR2_PACKAGE_OPENJDK
-- 
2.14.1

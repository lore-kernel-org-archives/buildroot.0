From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 17:20:26 +0200
Subject: [Buildroot] [git commit] package/dacapo: fix indentation
Message-ID: <20190414151621.75886884A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46cd7061228720ddb93f540bc733359304d8118f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

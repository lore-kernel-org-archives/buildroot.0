From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:52 +0100
Subject: [Buildroot] [PATCH v2 7/7] directfb-examples: bump version to 1.7.0
	and add hash
In-Reply-To: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425075952-24699-7-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - merged add hash patch (as suggested by Peter Korsgaard)
---
 package/directfb-examples/directfb-examples.hash | 2 ++
 package/directfb-examples/directfb-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/directfb-examples/directfb-examples.hash

diff --git a/package/directfb-examples/directfb-examples.hash b/package/directfb-examples/directfb-examples.hash
new file mode 100644
index 0000000..a4314ee
--- /dev/null
+++ b/package/directfb-examples/directfb-examples.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a  DirectFB-examples-1.7.0.tar.gz
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 3ba33b4..5dbbd5a 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIRECTFB_EXAMPLES_VERSION = 1.6.0
+DIRECTFB_EXAMPLES_VERSION = 1.7.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
-- 
2.1.4

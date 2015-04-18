From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2015 19:44:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version, add hash
In-Reply-To: <cover.1429379016.git.yann.morin.1998@free.fr>
References: <cover.1429379016.git.yann.morin.1998@free.fr>
Message-ID: <612c6835da3af662a1a3a2b644a9e1b7bd150094.1429379016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.hash | 2 ++
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/tzdata/tzdata.hash

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
new file mode 100644
index 0000000..d02829a
--- /dev/null
+++ b/package/tzdata/tzdata.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a  tzdata2015c.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 454ac29..d8512a3 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015a
+TZDATA_VERSION = 2015c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-tzdata
-- 
1.9.1

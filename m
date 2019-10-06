From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 17:14:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyaml: bump version to 0.2.2
Message-ID: <20191006151412.9658-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit:
https://github.com/yaml/libyaml/commit/24a020a1a2a1fbbb1caf3a032ccc81eb74018c31

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libyaml/libyaml.hash | 4 ++--
 package/libyaml/libyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index afc014dfb2..49693b507b 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd  yaml-0.2.1.tar.gz
-sha256 bfcb6a7dfbfd30e0ccc8bb34ab712bd1568586ad8c5b078ccae443b04e79749e  LICENSE
+sha256 4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9  yaml-0.2.2.tar.gz
+sha256 a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index dc7368a168..1ba069a1b2 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYAML_VERSION = 0.2.1
+LIBYAML_VERSION = 0.2.2
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
-- 
2.20.1

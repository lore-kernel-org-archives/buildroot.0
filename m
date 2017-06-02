From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 16:20:45 +0100
Subject: [Buildroot] [PATCH] openldap: bump version to 2.4.45
Message-ID: <20170602152045.47774-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openldap/openldap.hash | 8 ++++----
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 785c4897f..aec4aaebf 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,4 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.44.md5
-md5	693ac26de86231f8dcae2b4e9d768e51	openldap-2.4.44.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.44.sha1
-sha1	016a738d050a68d388602a74b5e991035cdba149	openldap-2.4.44.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.45.md5
+md5 00ff8301277cdfd0af728a6927042a13  openldap-2.4.45.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.45.sha1
+sha1 c98437385d3eaee80c9e2c09f3f0d4b7c140233d  openldap-2.4.45.tgz
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 2f738e51d..90ff1123b 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.44
+OPENLDAP_VERSION = 2.4.45
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.13.0

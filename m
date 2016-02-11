From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2016 23:12:02 +0100
Subject: [Buildroot] [git commit branch/next] openldap: bump to version
	2.4.44
Message-ID: <20160211221538.3D9CD800EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=580c518f89f882a045f1f058593198814c539590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.hash | 8 ++++----
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 83e790f..785c489 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,4 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.43.md5
-md5 49ca65e27891fcf977d78c10f073c705  openldap-2.4.43.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.43.sha1
-sha1 3b52924df2f45e81f25ecbe37551bc837d090cfa  openldap-2.4.43.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.44.md5
+md5	693ac26de86231f8dcae2b4e9d768e51	openldap-2.4.44.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.44.sha1
+sha1	016a738d050a68d388602a74b5e991035cdba149	openldap-2.4.44.tgz
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 17bf991..2f738e5 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.43
+OPENLDAP_VERSION = 2.4.44
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License

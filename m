From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:01:19 +0200
Subject: [Buildroot] [git commit] openldap: bump to version 2.4.41
Message-ID: <20150702090455.CC496818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a035206d106cab85301917205f649cfdbb92da6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openldap/openldap.hash |    6 +++---
 package/openldap/openldap.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index ff79a8a..cca1e38 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,4 @@
-# From:  ftp://mirror.switch.ch/mirror/OpenLDAP/openldap-release/openldap-2.4.40.sha1
-sha1  0cfac3b024b99de2e2456cc7254481b6644e0b96  openldap-2.4.40.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.41.sha1
+sha1  c6880df9fec928a5f010b78a4285b497e8a12d6b  openldap-2.4.41.tgz
 # Locally computed:
-sha256  d12611a5c25b6499293c2bb7b435dc2b174db73e83f5a8cb7e34f2ce5fa6dadb  openldap-2.4.40.tgz
+sha256  27856bb4a8b44feca2b326c309000e16a9dadd52362c8ab6eec6c67a43737f6e  openldap-2.4.41.tgz
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 68464ab..ecb1bce 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.40
+OPENLDAP_VERSION = 2.4.41
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License

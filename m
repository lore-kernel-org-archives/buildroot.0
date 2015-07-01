From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Jul 2015 13:39:36 +0200
Subject: [Buildroot] [PATCH 3/3] openldap: bump to version 2.4.41
In-Reply-To: <1435750776-3364-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435750776-3364-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1435750776-3364-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openldap/openldap.hash | 6 ++----
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index ff79a8a..353c7d9 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,2 @@
-# From:  ftp://mirror.switch.ch/mirror/OpenLDAP/openldap-release/openldap-2.4.40.sha1
-sha1  0cfac3b024b99de2e2456cc7254481b6644e0b96  openldap-2.4.40.tgz
-# Locally computed:
-sha256  d12611a5c25b6499293c2bb7b435dc2b174db73e83f5a8cb7e34f2ce5fa6dadb  openldap-2.4.40.tgz
+# Locally computed
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
-- 
2.3.6

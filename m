From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 11:28:10 +0200
Subject: [Buildroot] [git commit] audit: bump to version 2.6.2
Message-ID: <20160702092825.7F006807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c169fe616f4e069f8cee20f1c206fa0b39ff48a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 3712f43..62cd186 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	b04dbc16dd877c32c3a05a512ed825abfbd5fabd5d3ecca6b4fcbd6bbac5f94e	audit-2.6.tar.gz
+sha256	e04662a44466e4fd115dd91e0948154b3b002c325f2c0765ddfef6da0c8b65f1	audit-2.6.2.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 937244d..5486050 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6
+AUDIT_VERSION = 2.6.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING

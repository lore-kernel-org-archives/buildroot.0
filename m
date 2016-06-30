From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:45:04 +0200
Subject: [Buildroot] [git commit] audit: bump to version 2.6
Message-ID: <20160701091149.12C658183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d863965a4ed93c6cde458a8e942737933d2bc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index f234fdb..3712f43 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	25f57f465f3230d7b1166b615ffd6748818a3dc225d0e8b396c5b2e951674e23	audit-2.4.4.tar.gz
+sha256	b04dbc16dd877c32c3a05a512ed825abfbd5fabd5d3ecca6b4fcbd6bbac5f94e	audit-2.6.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 1fbc623..937244d 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.4.4
+AUDIT_VERSION = 2.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING

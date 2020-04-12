From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:33:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/omniorb: bump version to 4.2.4
Message-ID: <20200412143354.1412969-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.4/

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/omniorb/omniorb.hash | 7 ++++---
 package/omniorb/omniorb.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 9911c4d6af..5ac8614689 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,7 +1,8 @@
-# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.3/
-sha1	0af1b8c181088c096de237315cce7b52fc457c78  omniORB-4.2.3.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.4/
+sha1 a6f3c8e96fc09c4ef8d75bd495bbc5256a4773ee  omniORB-4.2.4.tar.bz2
+md5 de961e8aa29f3eed95ea40a94c1cccdf  omniORB-4.2.4.tar.bz2
 
 # Locally generated
-sha256	26412ac08ab495ce5a6a8e40961fa20b7c43f623c6c26b616d210ca32f078bca  omniORB-4.2.3.tar.bz2
+sha256	28c01cd0df76c1e81524ca369dc9e6e75f57dc70f30688c99c67926e4bdc7a6f  omniORB-4.2.4.tar.bz2
 sha256	126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
 sha256	eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b5caf6ff8b..4ecbb9d2c9 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.2.3
+OMNIORB_VERSION = 4.2.4
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-- 
2.25.0

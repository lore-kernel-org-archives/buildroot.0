From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Nov 2016 17:21:52 +0000
Subject: [Buildroot] [PATCH next] ncftp: bump version to 3.2.6
Message-ID: <20161130172152.35197-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream provides xz tarballs instead of bz2, so make the switch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ncftp/ncftp.hash | 2 +-
 package/ncftp/ncftp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 1169589..0a7c26c 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  b4ebe2415761a5137cd1d313c8fc1352f26d8963cc9e9e354e29720aa2089d42  ncftp-3.2.5-src.tar.bz2
+sha256 7abd3e8f848f0efb4bb6a4bc5da58a59524d4378fc8d70a52adb0fe1fd00b89d  ncftp-3.2.6-src.tar.xz
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 28b03b8..5c88556 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.5
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.bz2
+NCFTP_VERSION = 3.2.6
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
 NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
-- 
2.10.1

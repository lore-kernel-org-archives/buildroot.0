From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 12:06:57 +0200
Subject: [Buildroot] [PATCH 3 of 4] ncftp: add license information
In-Reply-To: <patchbomb.1381226814@argentina>
References: <patchbomb.1381226814@argentina>
Message-ID: <0c52e8e64bc16f37df1e.1381226817@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/ncftp/ncftp.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -8,6 +8,8 @@ NCFTP_VERSION = 3.2.5
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
 NCFTP_TARGET_BINS = ncftp
+NCFTP_LICENSE = Clarified Artistic License
+NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
 	NCFTP_TARGET_BINS += ncftpget

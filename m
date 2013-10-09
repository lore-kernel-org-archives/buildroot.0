From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:27:45 +0200
Subject: [Buildroot] [git commit] ncftp: add license information
Message-ID: <20131009202946.3B8719B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d1c9f8c8068e885a614af3ad9966a7ba07f9d83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/ncftp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index a51605e..56d5d47 100644
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

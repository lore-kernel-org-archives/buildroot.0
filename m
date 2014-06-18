From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:04:22 +0200
Subject: [Buildroot] [git commit] ngircd: switch site now that berlios is
	gone
Message-ID: <20140618123420.1F64A9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f9eb8e60bd879026ff0ecc7d6afd8c2ba207116
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 13313a7..2eb89af 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -6,7 +6,7 @@
 
 NGIRCD_VERSION = 20.3
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
-NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_SITE = http://arthur.barton.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPLv2+
 NGIRCD_LICENSE_FILES = COPYING

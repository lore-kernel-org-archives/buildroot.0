From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Dec 2015 21:59:54 +0100
Subject: [Buildroot] [git commit branch/2015.11.x] dropbear: bump to version
	2015.71
Message-ID: <20151204210134.86043821B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45c566ea5d4a501bd05378019d8bb9c0655c8ed2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2015.11.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c2505381d0103d94e4202bad949fa37184b01920)
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 4b2d99a..934b26b 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257  dropbear-2015.70.tar.bz2
+sha256	376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af  dropbear-2015.71.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index f32a60d..e7633ae 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2015.70
+DROPBEAR_VERSION = 2015.71
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c

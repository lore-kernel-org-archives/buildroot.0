From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 14:35:55 +0100
Subject: [Buildroot] [git commit] dropbear: security bump to 2016.72
Message-ID: <20160310133648.0F47E7FADA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aea2d241137b20187556ee27915a830835b209a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2016.72 - 9 March 2016

- Validate X11 forwarding input. Could allow bypass of authorized_keys command= restrictions,
  found by github.com/tintinweb. Thanks to Damien Miller for a patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 934b26b..8287244 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af  dropbear-2015.71.tar.bz2
+sha256	9323766d3257699fd7d6e7b282c5a65790864ab32fd09ac73ea3d46c9ca2d681  dropbear-2016.72.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e7633ae..4ba94c3 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2015.71
+DROPBEAR_VERSION = 2016.72
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c

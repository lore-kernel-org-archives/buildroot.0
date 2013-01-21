From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:15:16 +0100
Subject: [Buildroot] [git commit] neardal: bump version to 0.8
Message-ID: <20130121225446.68B2A9A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=caf19397fbad36155a91a3bab4851f08c1585cb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neardal/neardal.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 66b729d..9625f0e 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -3,7 +3,8 @@
 # neardal
 #
 #############################################################
-NEARDAL_VERSION = 0.7
+
+NEARDAL_VERSION = 0.8
 NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
 NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
 NEARDAL_INSTALL_STAGING = YES

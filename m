From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 17:24:53 +0200
Subject: [Buildroot] [git commit] ccid: fix header line
Message-ID: <20130606153924.5B8099A99B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f397d2ce9e42c7b37a5707057482fecf21aec13e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccid/ccid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 51c3887..570b1e8 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -2,7 +2,7 @@
 #
 # CCID
 #
-# ########################################################
+##########################################################
 CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = http://alioth.debian.org/frs/download.php/3768

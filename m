From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 21:37:03 +0100
Subject: [Buildroot] [git commit] fbset: define license
Message-ID: <20130207230042.1DCEE9A9B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1dd19d2a7b4a19395ed99420cf08d1a48081167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2 like Linux]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbset/fbset.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 3423259..b8a8f43 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -7,6 +7,7 @@
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_LICENSE = GPLv2
 
 # Make sure full fbset wins over busybox fbset
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)

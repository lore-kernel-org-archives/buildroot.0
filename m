From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Mar 2013 22:29:50 +0100
Subject: [Buildroot] [git commit] eeprog.mk: fix site
Message-ID: <20130312213138.5223B9B061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bc8cd99591491b622f6444de2f1f9d7aa6048e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eeprog/eeprog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e64fa06..3b1b3e9 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 EEPROG_VERSION = 0.7.6
-EEPROG_SITE = http://codesink.org/download
+EEPROG_SITE = http://www.codesink.org/download
 
 define EEPROG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

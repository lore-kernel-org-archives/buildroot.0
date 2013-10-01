From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:20:24 +0200
Subject: [Buildroot] [git commit] picocom: bump to version 1.7
Message-ID: <20131001192230.37F8D9B8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6230c24279ce4eb2fb0b6f14adc2347f8de88b90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/picocom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 4298faa..8f8ad20 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 1.6
+PICOCOM_VERSION = 1.7
 PICOCOM_SITE    = http://picocom.googlecode.com/files/
 
 define PICOCOM_BUILD_CMDS

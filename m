From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 11:52:57 +0100
Subject: [Buildroot] [git commit] rings: add the version major variable
Message-ID: <20140114105712.DBF6E9C4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af23b6e128cd5b2d9c93059a1810183cc1590cda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rings/rings.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index d052f5d..2876162 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RINGS_VERSION = 1.3.0-1
+RINGS_VERSION_MAJOR = 1.3.0
+RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
 RINGS_SUBDIR  = rings-v_1_3_0
 RINGS_LICENSE = MIT
 

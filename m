From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:21:39 +0100
Subject: [Buildroot] [git commit] ljlinenoise: bump to version 0.1.2
Message-ID: <20150202202159.E2C0A805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26b038714ed64762c540cb17bd773114e77a5ea3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljlinenoise/ljlinenoise.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index 868f319..aca6358 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJLINENOISE_VERSION_UPSTREAM = 0.1.1
+LJLINENOISE_VERSION_UPSTREAM = 0.1.2
 LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
 LJLINENOISE_SUBDIR = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
 LJLINENOISE_LICENSE = MIT

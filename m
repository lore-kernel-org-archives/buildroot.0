From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:42:35 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/irqbalance: bump
 version to 1.7.0
Message-ID: <20210317191910.4E0DF88211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1abb1d1187dd59bdd812308bdf8025993151acc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

For details see [1].

[1] https://github.com/Irqbalance/irqbalance/releases/tag/v1.7.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df18d209b42b9869b0af8495cc3f052df44a2518)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 2e7cf49c25..587173ca65 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5ace9dd69d5190e24ee34210c3131333e9963e3ba649bf9237eabb4313c300d2  irqbalance-1.6.0.tar.gz
+sha256 28f2ad35945b93d90f4a5bad95b4c0871a0f644375f746ec16f61045b9ec970e  irqbalance-1.7.0.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 36e9e42493..b099f7c6e2 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.6.0
+IRQBALANCE_VERSION = 1.7.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING

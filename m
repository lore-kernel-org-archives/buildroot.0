From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:48:01 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/bwm-ng: license
 is GPL-2.0+
Message-ID: <20190930134253.79FE5836CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ded5943994104a39dff95a255e25f8ff4f5776d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

The source files contain the "(at your option) any later version" text, so
change the licese to GPL-2.0+.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f58ea370da70a3bbda174f77d3094975bb142161)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bwm-ng/bwm-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 587ffbea5b..32e097e23f 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -7,7 +7,7 @@
 BWM_NG_VERSION = f54b3fad2c80bfe63f920c9b5e7c1d80389c57ef
 BWM_NG_SITE = $(call github,vgropp,bwm-ng,$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
-BWM_NG_LICENSE = GPL-2.0
+BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
 BWM_NG_AUTORECONF = YES
 

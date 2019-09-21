From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:50:10 +0200
Subject: [Buildroot] [git commit] package/bwm-ng: license is GPL-2.0+
Message-ID: <20190921134530.334518EDF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f58ea370da70a3bbda174f77d3094975bb142161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source files contain the "(at your option) any later version" text, so
change the licese to GPL-2.0+.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bwm-ng/bwm-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 5e663dafea..4a34559e3c 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -7,7 +7,7 @@
 BWM_NG_VERSION = 0.6.2
 BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
-BWM_NG_LICENSE = GPL-2.0
+BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
 BWM_NG_AUTORECONF = YES
 

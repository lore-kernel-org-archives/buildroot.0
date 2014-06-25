From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:34:25 +0200
Subject: [Buildroot] [git commit] gtkperf: add license information
Message-ID: <20140625211213.9F8F59D0C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=479ea160da99e54a36cc1516051edd3004b3a60e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtkperf/gtkperf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index fa9531d..0542a26 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -8,5 +8,7 @@ GTKPERF_VERSION = 0.40
 GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
 GTKPERF_DEPENDENCIES = libgtk2
+GTKPERF_LICENSE = GPLv2
+GTKPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:42:50 +0200
Subject: [Buildroot] [git commit] sysstat: define license
Message-ID: <20130628195145.4B0AE9B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e1ac8931c077c3eb45a0353ac7565cf4c2a0d9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysstat/sysstat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 73e20d3..02e4c88 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -9,6 +9,8 @@ SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
+SYSSTAT_LICENSE = GPLv2+
+SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext

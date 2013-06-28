From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:27:36 +0200
Subject: [Buildroot] [git commit] dstat: define license
Message-ID: <20130628195142.1D9169B291@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db8b9f3c0853fe0020f79facab401560a2aa2235
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dstat/dstat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index de0f0a8..e71b0cc 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -7,6 +7,8 @@
 DSTAT_VERSION = 0.7.2
 DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
 DSTAT_SITE = http://dag.wieers.com/home-made/dstat
+DSTAT_LICENSE = GPLv2
+DSTAT_LICENSE_FILES = COPYING
 
 define DSTAT_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:30:52 +0200
Subject: [Buildroot] [git commit] elftosb: add license information
Message-ID: <20140701153344.2AFDD9D131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0f2a1d64b346f4d42950d163740e71040620066
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elftosb/elftosb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index 9b825a0..ac9aa32 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -6,6 +6,8 @@
 
 ELFTOSB_VERSION = 10.12.01
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
+ELFTOSB_LICENSE = BSD-3c
+ELFTOSB_LICENSE_FILES = COPYING
 
 define HOST_ELFTOSB_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all

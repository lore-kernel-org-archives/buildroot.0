From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:03:14 +0100
Subject: [Buildroot] [git commit] netatalk: bump to version 3.0.8
Message-ID: <20140311220647.999C29BEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbdbb313310842898dad7585103f2ea49b517fa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 2bd63ec..e5e5c6b 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.0.5
+NETATALK_VERSION = 3.0.8
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 NETATALK_AUTORECONF = YES

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Aug 2014 10:13:51 +0200
Subject: [Buildroot] [git commit branch/next] nano: bump to version 2.3.6
Message-ID: <20140809081638.EC7599D3FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30a6416d4a51b30f6fac501902214f2dd0d4a4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3a17e7f..9557a93 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.3
-NANO_VERSION = $(NANO_VERSION_MAJOR).5
+NANO_VERSION = $(NANO_VERSION_MAJOR).6
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING

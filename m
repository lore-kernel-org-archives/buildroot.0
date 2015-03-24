From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Mar 2015 10:21:00 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.4.0
Message-ID: <1427203260-25616-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to gnu mirror.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 7bc8f37..b77e63a 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a74bf3f18b12c1c777ae737c0e463152439e381aba8720b4bc67449f36a09534	nano-2.3.6.tar.gz
+sha256	5076fb502680503e648cbdcbf2077e39fba193420ae19203f0a54cb2d94a75bd	nano-2.4.0.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index cb8b60e..0bd894f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.3
-NANO_VERSION = $(NANO_VERSION_MAJOR).6
-NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
+NANO_VERSION = 2.4.0
+NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
 NANO_CONF_OPTS = --without-slang
-- 
2.0.5

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 22:54:36 +0200
Subject: [Buildroot] [git commit] monkey: fix license typos
Message-ID: <20150719205445.DD1617FCD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=390e778db22d9d9b2feca36faf29326d62717b9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monkey/monkey.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 31e8846..73fbd62 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -7,8 +7,8 @@
 MONKEY_VERSION_MAJOR = 1.5
 MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
-MONKEY_LICENCE = Apache-2.0
-MONKEY_LICENCE_FILE = LICENSE
+MONKEY_LICENSE = Apache-2.0
+MONKEY_LICENSE_FILES = LICENSE
 
 # This package has a configure script, but it's not using
 # autoconf/automake, so we're using the generic-package

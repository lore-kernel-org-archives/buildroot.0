From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:54:19 +0200
Subject: [Buildroot] [PATCH] Makefile.autotools.in: fix minimal foo.mk
	example
Message-ID: <1241351659-5506-1-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directory argument was introduced to support packages in
subdirectories of package/ several months ago.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 3c01837..d6da7e8 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -10,7 +10,7 @@
 # | FOO_VERSION = 1.0
 # | FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
 # | FOO_SITE = http://www.libfoo.org/dist
-# | $(eval $(call AUTOTARGETS,foo))
+# | $(eval $(call AUTOTARGETS,package,foo))
 #
 ## The following targets can be called from the shell:
 #
-- 
1.6.3.rc4.11.g6eda9

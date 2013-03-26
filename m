From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 08:38:29 +0100
Subject: [Buildroot] [PATCH] bash: add missing dependency on host-bison
Message-ID: <1364283509-4231-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/dfedb4377a95e36e590c9a5a5853e3ed0ecbc247/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/bash.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d28c615..fff0604 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -6,7 +6,7 @@
 
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
-BASH_DEPENDENCIES = ncurses
+BASH_DEPENDENCIES = ncurses host-bison
 BASH_LICENSE = GPLv3+
 BASH_LICENSE_FILES = COPYING
 
-- 
1.7.9.5

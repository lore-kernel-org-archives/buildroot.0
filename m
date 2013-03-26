From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Mar 2013 08:45:15 +0100
Subject: [Buildroot] [git commit] bash: add missing dependency on host-bison
Message-ID: <20130326074839.952CD9B2CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=895c6ce9b178091a1992f9cd17ee426006ab3303
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/dfedb4377a95e36e590c9a5a5853e3ed0ecbc247/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 

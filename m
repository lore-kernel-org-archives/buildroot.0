From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 23:18:32 +0100
Subject: [Buildroot] [git commit] psplash: use git repository
Message-ID: <20140115221857.3AE179C4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7f6e2499a1f521a88929f5c5cb775e42703b277
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

psplash doesn't see a new release for quite some time. The lattest
commits brought some nice bug fixes and a feature that allows to
easily customize the splash image.

[Peter: COPYING file no longer available]
Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/psplash/psplash.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index cb1c54a..83b6f79 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 0.1
-PSPLASH_SITE = http://downloads.yoctoproject.org/releases/psplash
+PSPLASH_VERSION = afd4e228c606a9998feae44a3fed4474803240b7
+PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPLv2+
-PSPLASH_LICENSE_FILES = COPYING
+PSPLASH_AUTORECONF = YES
 
 $(eval $(autotools-package))

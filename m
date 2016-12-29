From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Dec 2016 21:54:33 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] Update for 2016.11.1
Message-ID: <20161229205543.CFC978028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0690cc883c4d4051e8cd18ab14130c0f59740eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fbf217a..97f1bdd 100644
--- a/Makefile
+++ b/Makefile
@@ -83,7 +83,7 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.11
+export BR2_VERSION := 2016.11.1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)

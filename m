From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Dec 2015 22:05:46 +0100
Subject: [Buildroot] [git commit] Kickoff 2016.02 cycle
Message-ID: <20151201214334.888AF8027D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2318c29e80e1b06d9c70714a51c79dca567652e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b345471..26430de 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11
+export BR2_VERSION := 2016.02-git
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:45:10 +0100
Subject: [Buildroot] [git commit] lpty: remove LPTY_VERSION_UPSTREAM
Message-ID: <20170302214521.B822A8213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97b723685aae570d897d81b22187e28a464839b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not used for anything.

Note that the SUBDIR is NOT the usual lpty-$(LPTY_VERSION_UPSTREAM);
it *does* have the rockspec version in its name.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lpty/lpty.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lpty/lpty.mk b/package/lpty/lpty.mk
index 963ab61..5a69125 100644
--- a/package/lpty/lpty.mk
+++ b/package/lpty/lpty.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LPTY_VERSION_UPSTREAM = 1.0.1
-LPTY_VERSION = $(LPTY_VERSION_UPSTREAM)-1
+LPTY_VERSION = 1.0.1-1
 LPTY_SUBDIR = lpty-$(LPTY_VERSION)
 LPTY_LICENSE = MIT
 LPTY_LICENSE_FILES = $(LPTY_SUBDIR)/doc/LICENSE

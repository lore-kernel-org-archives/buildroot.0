From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:27 +0100
Subject: [Buildroot] [PATCH 05/25] lpty: remove LPTY_VERSION_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not used for anything.

Note that the SUBDIR is NOT the usual lpty-$(LPTY_VERSION_UPSTREAM);
it *does* have the rockspec version in its name.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lpty/lpty.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lpty/lpty.mk b/package/lpty/lpty.mk
index 963ab61103..5a691256c1 100644
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
-- 
2.11.0

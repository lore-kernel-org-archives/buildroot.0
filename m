From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 22:10:12 +0100
Subject: [Buildroot] [git commit] python3: bump version
Message-ID: <20140317211030.6C8799C0D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b40eb002646d3374123094b220c7f18497b7c461
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3d95a6d..ce75e46 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -6,7 +6,7 @@
 
 PYTHON3_VERSION_MAJOR = 3.4
 PYTHON3_VERSION_MINOR = 0
-PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)rc1
+PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
 PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE          = http://python.org/ftp/python/$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
 

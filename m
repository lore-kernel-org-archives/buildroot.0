From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:46:51 +0200
Subject: [Buildroot] [git commit branch/next] empty: add license information
Message-ID: <20120802195306.4842A8F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efe6941f1ba641f7bb1d0ee8b1db43d8518a2894
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/empty/empty.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 97b1e7e..005f880 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -6,6 +6,8 @@
 EMPTY_VERSION = 0.6.18b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
+EMPTY_LICENSE = BSD-3c
+EMPTY_LICENSE_FILES = COPYRIGHT
 
 define EMPTY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all

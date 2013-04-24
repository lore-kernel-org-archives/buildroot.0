From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 22:18:06 +0200
Subject: [Buildroot] [git commit] xz: add XZ definition for the host variant
Message-ID: <20130424201905.0F6899B812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b935275ec540400b417bd28649e510b4358416a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8ff3c83..877c631 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -14,3 +14,5 @@ XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+XZ = $(HOST_DIR)/usr/bin/xz

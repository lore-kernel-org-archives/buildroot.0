From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 22:27:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix license
Message-ID: <20191207212720.1301402-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License is GPL-2.0+ not GPL-2.0 as specified in files that contain
license information: tilde.{h,c} and xmalloc.{h,c}

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ytree/ytree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index d9716f93ba..379be1e8e0 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -6,7 +6,7 @@
 
 YTREE_VERSION = 1.99pl2
 YTREE_SITE = https://www.han.de/~werner
-YTREE_LICENSE = GPL-2.0
+YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
 YTREE_DEPENDENCIES = ncurses
 
-- 
2.24.0

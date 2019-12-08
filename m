From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 13:58:32 +0100
Subject: [Buildroot] [git commit] package/ytree: bump to version 2.00
Message-ID: <20191208132020.376437F88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3ee9c4337f75c2fdcaeab2484639044505f0ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is GPL-2.0+ not GPL-2.0 as specified in files that contain
license information: tilde.{h,c} and xmalloc.{h,c}

Release 2.00 also added a comment about this in CHANGES and README

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 3405c22d37..34ec8fefda 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9d14e173183676bfb5da93ff90909547aa19f888504e45058a91f3bbd9d9112d  ytree-1.99pl2.tar.gz
+sha256 da8ecaf8e15f8b0d3077ea88da8db9cd607f72ed2a51e91a24d6ef3ff017c6bf  ytree-2.00.tar.gz
 sha256 eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index d9716f93ba..5a90264f42 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-YTREE_VERSION = 1.99pl2
+YTREE_VERSION = 2.00
 YTREE_SITE = https://www.han.de/~werner
-YTREE_LICENSE = GPL-2.0
+YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
 YTREE_DEPENDENCIES = ncurses
 

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:49:09 +0100
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.02
Message-ID: <20200320203618.E65FB82A99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99c12cace359fc1b9459e722f861a3aaf840f8f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two space in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ytree/ytree.hash | 4 ++--
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 34ec8fefda..1e620e30e9 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 da8ecaf8e15f8b0d3077ea88da8db9cd607f72ed2a51e91a24d6ef3ff017c6bf  ytree-2.00.tar.gz
-sha256 eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
+sha256  e5bf41ab6bee59cf1e8fc0ca429e9a18e6aa83823f30f5807042b04c88a0e0ec  ytree-2.02.tar.gz
+sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 5a90264f42..48b3f7eff9 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.00
+YTREE_VERSION = 2.02
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING

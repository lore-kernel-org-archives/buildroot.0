From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 08:07:03 +0100
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.03
Message-ID: <20210106064925.ED23182CFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9960e469f140b0dcb20988fc5d86fb271c82c391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 1e620e30e9..17d0d24c74 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5bf41ab6bee59cf1e8fc0ca429e9a18e6aa83823f30f5807042b04c88a0e0ec  ytree-2.02.tar.gz
+sha256  583aa71552d1347e0eabe39a236fa5a174bf67dde98871853b9fe2a233bcaef1  ytree-2.03.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 48b3f7eff9..fdecc0b19b 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.02
+YTREE_VERSION = 2.03
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING

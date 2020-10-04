From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:35:47 +0200
Subject: [Buildroot] [git commit] package/altera-stapl: change to tagged
 version 0.3.3
Message-ID: <20201004094312.9CAC78125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09340dd5bc12edf2fa50048ea54539d820e0fce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/altera-stapl/altera-stapl.hash | 2 +-
 package/altera-stapl/altera-stapl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/altera-stapl/altera-stapl.hash b/package/altera-stapl/altera-stapl.hash
index 29e62b9d44..c3af649c40 100644
--- a/package/altera-stapl/altera-stapl.hash
+++ b/package/altera-stapl/altera-stapl.hash
@@ -1,2 +1,2 @@
-sha256  7f72c234f2fd0181140b6f1f09fc272eae07f20622cec7f26e3b3499ff69825a  altera-stapl-7044a63b7d1a3fc6840cd3130ec984454f1559c0.tar.gz
+sha256  a4d85a79790eab851399132fce4524979fe764d5297413b2445673e6a190bb42  altera-stapl-0.3.3.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/altera-stapl/altera-stapl.mk b/package/altera-stapl/altera-stapl.mk
index 189b6c4ced..afafbe2d08 100644
--- a/package/altera-stapl/altera-stapl.mk
+++ b/package/altera-stapl/altera-stapl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALTERA_STAPL_VERSION = 7044a63b7d1a3fc6840cd3130ec984454f1559c0
+ALTERA_STAPL_VERSION = 0.3.3
 ALTERA_STAPL_SITE = $(call github,kontron,altera-stapl,$(ALTERA_STAPL_VERSION))
 ALTERA_STAPL_LICENSE = GPLv2+
 ALTERA_STAPL_LICENSE_FILES = COPYING

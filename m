From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 23:09:30 +0100
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.11.3
Message-ID: <20210104215338.4375A8264D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9425ec501f8e235b6f4901de6170de3a01c43e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dash/dash.hash | 2 +-
 package/dash/dash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 069a7b179b..24cc7318bd 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
 # From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
-sha256  00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f  dash-0.5.11.2.tar.gz
+sha256  62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a  dash-0.5.11.3.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 88caa66090..1712dcf599 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11.2
+DASH_VERSION = 0.5.11.3
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING

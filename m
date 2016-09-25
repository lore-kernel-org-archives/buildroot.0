From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:13:40 +0200
Subject: [Buildroot] [git commit] irssi: security bump to version 0.8.20
Message-ID: <20160925211356.61FF57F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b1d943fe1a743d89e743ee74e0cfd28e1b2867f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes two remote crash issues since version 0.8.17

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index f65d6c3..33b2d0e 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4ca0040548e814ea93eb7d602ab7d6d379afcbbdf10e84160523ce69c73ee5d3	irssi-0.8.19.tar.xz
+sha256	7882c4e821f5aac469c5e69e69d7e235f4986101285c675e81a9a95bfb20505a	irssi-0.8.20.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index a1e278e..0fb6fc7 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.19
+IRSSI_VERSION = 0.8.20
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.

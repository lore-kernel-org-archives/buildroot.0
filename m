From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:19:34 +0200
Subject: [Buildroot] [git commit] gnupg: security bump to version 1.4.15
Message-ID: <20131009202219.F3A509B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72c71c86903d411f2bd5a3eef44cd427a6298426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-4402.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 38604b5..28f1f43 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.14
+GNUPG_VERSION = 1.4.15
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:23:50 +0200
Subject: [Buildroot] [git commit] package/msmtp: bump to version 1.8.3
Message-ID: <20190413143605.93F448E168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae8243891d21017ace60399e32d35e3d8061ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index f966e5d6d4..9e3633af6b 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.0.tar.xz.sig
-sha256	bd730cbf000d1b8382849ea21d569a387e63f936be00dc07c569f67915e53ccd	msmtp-1.8.0.tar.xz
+# https://marlam.de/msmtp/releases/msmtp-1.8.3.tar.xz.sig
+sha256	3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4	msmtp-1.8.3.tar.xz
 
 # Hash for license file:
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index db3d42cd94..dbd684f107 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.0
+MSMTP_VERSION = 1.8.3
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf

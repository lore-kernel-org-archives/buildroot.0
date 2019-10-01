From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 07:18:10 +0200
Subject: [Buildroot] [git commit] package/msmtp: bump to version 1.8.6
Message-ID: <20191001051737.AA125840F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f4c0589440df395b8dba399d2be0718229c9d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the NEWS file:

Version 1.8.6:
- Aliases are now expanded recursively
- Minor bug fixes

Version 1.8.5:
- Fixed OAUTHBEARER.
- Support for TLS client certificates via PKCS11 devices, e.g. smart cards.
- Various small bug fixes and improvements.

Version 1.8.4:
- Added support for the OAUTHBEARER authentication method.
- Several minor bug fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 9e3633af6b..9849c547c2 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.3.tar.xz.sig
-sha256	3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4	msmtp-1.8.3.tar.xz
+# https://marlam.de/msmtp/releases/msmtp-1.8.6.tar.xz.sig
+sha256	6625f147430c65ba8527f52c4fe5d4d33552d3c0fb6d793ba7df819a3b3042e1	msmtp-1.8.6.tar.xz
 
 # Hash for license file:
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index dbd684f107..1518aa10e4 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.3
+MSMTP_VERSION = 1.8.6
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf

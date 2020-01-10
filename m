From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:19:29 +0100
Subject: [Buildroot] [git commit] package/pinentry: bump to version 1.1.0
Message-ID: <20200110212036.2CC188898A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dbf60c7b5ae3eee28d3a36260294bef2fe21940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pinentry/pinentry.hash | 5 +++--
 package/pinentry/pinentry.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index ef450b3c41..c9610d6eb1 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,4 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  85d9ac81ebad3fb082514c505c90c39a0456f1f6  pinentry-1.0.0.tar.bz2
+sha1  693bdf9f48dfb3e040d92f50b1bb464e268b9fb0  pinentry-1.1.0.tar.bz2
 # Locally computed
-sha256 1672c2edc1feb036075b187c0773787b2afd0544f55025c645a71b4c2f79275a  pinentry-1.0.0.tar.bz2
+sha256 68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570  pinentry-1.1.0.tar.bz2
+sha256 67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index ce82f1090a..0e9dfb2f0e 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.0.0
+PINENTRY_VERSION = 1.1.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+

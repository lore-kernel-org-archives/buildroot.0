From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 15:51:17 +0100
Subject: [Buildroot] [git commit] nano: bump version to 2.7.4
Message-ID: <20170110145137.95E7D81E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2200ece1d9c9dd221e7e69cb02a52ba03e4242c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 94fd990..aa3e27b 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d926ef5060d23bafec75dab9328bb9b9df9a08e58c56b9061d686f5698770bfc  nano-2.7.3.tar.xz
+sha256 752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9  nano-2.7.4.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index da92268..4632bed 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).3
+NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+

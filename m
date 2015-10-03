From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 23:20:52 +0200
Subject: [Buildroot] [git commit] dovecot: bump to version 2.2.19
Message-ID: <20151003212214.D9A2581794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09a8abe4abe40731ad8a52f7facc9346fa8a5a7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash |    2 +-
 package/dovecot/dovecot.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 8b6e8f5..9386df0 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b6d8468cea47f1227f47b80618f7fb872e2b2e9d3302adc107a005dd083865bb	dovecot-2.2.18.tar.gz
+sha256 759e1e3f9d907cdaabad1f5fbacc793ca191d234c084bec3bba42966952a4e9f  dovecot-2.2.19.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 58666d0..69f722f 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).18
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).19
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1

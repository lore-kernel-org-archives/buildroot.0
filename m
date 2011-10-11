From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 13:52:10 +0200
Subject: [Buildroot] [git commit] neon: additional white space fix
Message-ID: <20111011115311.7A95B8E2EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=760d4afd44f95db88b64897dca056ec426323dc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed from 66e09abc57 (neon: cleanup).

Thanks to Michael S. Zick for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 272d5e0..6e365b3 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -3,7 +3,7 @@
 # neon
 #
 #############################################################
-NEON_VERSION= 0.29.6
+NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath

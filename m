From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 22:12:03 +0200
Subject: [Buildroot] [git commit] libnspr: add license info
Message-ID: <20130602212056.1D6809A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14eb60e2912bc458c842d7d0110b05f0aacdc095
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index e934281..71b64b9 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -9,6 +9,8 @@ LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_
 LIBNSPR_SUBDIR = mozilla/nsprpub
 LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
+LIBNSPR_LICENSE = MPLv2.0
+LIBNSPR_LICENSE_FILES = mozilla/nsprpub/LICENSE
 
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \

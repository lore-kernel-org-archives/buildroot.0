From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 22:17:29 +0100
Subject: [Buildroot] [git commit] openssh: bump version
Message-ID: <20131110223451.8D8F99BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a0e1258f369d9fcf75e977c3a76727a9a3096a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the announcement:

This release fixes a security bug:

 * sshd(8): fix a memory corruption problem triggered during rekeying
   when an AES-GCM cipher is selected. Full details of the vulnerability
   are available at: http://www.openssh.com/txt/gcmrekey.adv

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f0652e5..8ab2b47 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.3p1
+OPENSSH_VERSION = 6.4p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \

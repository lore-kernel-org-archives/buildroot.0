From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 10:36:59 +0200
Subject: [Buildroot] [git commit] openssh: add license information
Message-ID: <20140507120710.9F8869CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d629983d892fdb7365de25ff6d8abc2fb7d748a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index e35ea10..e55f5eb 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,6 +6,8 @@
 
 OPENSSH_VERSION = 6.6p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
+OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
+OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip

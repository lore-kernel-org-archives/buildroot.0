From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 11:30:06 +0200
Subject: [Buildroot] [git commit] dropbear: bump to version 2013.60
Message-ID: <20131022093346.DF5F19BAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a95b9d77d1dc3ce79be680b3aec70627fda2c92b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index c4372ca..7fa9273 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2013.59
+DROPBEAR_VERSION = 2013.60
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh

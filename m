From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jan 2017 22:05:43 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.4.9
Message-ID: <20170104210556.4D72B81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=952e8c33e4df128ac25cc7dc08c35dcc2d568875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1e36d73..04b36dc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0e54de8a22b77f9712578029639331b51f818b70e194766c98475a5b99470fbf	samba-4.4.8.tar.gz
+sha256	10f76fa113213ae512db4a4823351178c93fb6bc95d98d0ebc72e3a74d43386f	samba-4.4.9.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 778902f..065bf1f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.8
+SAMBA4_VERSION = 4.4.9
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

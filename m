From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:52:03 +0200
Subject: [Buildroot] [git commit] package/ndisc6: bump version to 1.0.3
Message-ID: <20170913094504.84D2B81092@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bf62576c12fff7141a4262cdf3fe541e86b82e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index 8d71bde..e37e33e 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad62ca7a	ndisc6-1.0.2.tar.bz2
+sha256 0f41d6caf5f2edc1a12924956ae8b1d372e3b426bd7b11eed7d38bc974eec821  ndisc6-1.0.3.tar.bz2
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 3ab8306..1b15937 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.2
+NDISC6_VERSION = 1.0.3
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)

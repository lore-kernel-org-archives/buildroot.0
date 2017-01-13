From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:06:45 +0100
Subject: [Buildroot] [git commit] pcre: bump to version 8.40
Message-ID: <20170113152113.EF5277FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5652b0e0c619f0a87bb5f75ab628703775d72eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.hash | 2 +-
 package/pcre/pcre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index bc50042..4c3c6c3 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b	pcre-8.39.tar.bz2
+sha256	00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4	pcre-8.40.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index a10950d..211e235 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.39
+PCRE_VERSION = 8.40
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c

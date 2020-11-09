From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:37:44 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/jsoncpp: security
 bump version to 1.9.4
Message-ID: <20201109092714.8BA6988044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb3817d333c2be1d5f0c67a561fe17c9cf19781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes of this "Security and build system fixes" release:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b2019a5183b28d36e52eacc64d50c3e0fc402fb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 45f0b161ff..0070a1874e 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8593c1d69e703563d94d8c12244e2e18893eeb9a8a9f8aa3d09a327aa45c8f7d  jsoncpp-1.9.3.tar.gz
+sha256  e34a628a8142643b976c7233ef381457efad79468c67cb1ae0b83a33d7493999  jsoncpp-1.9.4.tar.gz
 sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 2766716947..cfded2bf07 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.3
+JSONCPP_VERSION = 1.9.4
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE

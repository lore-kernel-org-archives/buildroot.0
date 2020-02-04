From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 11:47:00 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libxml2: bump to
 version 2.9.10
Message-ID: <20200204103559.6943C8A521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80326d174c38abec17e4950d45ebc74a6f47bb0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Adds the --dynamic option to xml2-config, needed by libxslt 1.1.34+.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: mention the dependency from libxslt]
(cherry picked from commit 2eeff0627233d9cecfa232dc0b3689ec8c1db4a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index ce8f5ef7f2..d890713a7c 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871	libxml2-2.9.9.tar.gz
+sha256	aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f	libxml2-2.9.10.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f4b4de090e..f6cf084b2b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.9
+LIBXML2_VERSION = 2.9.10
 LIBXML2_SITE = http://xmlsoft.org/sources
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT

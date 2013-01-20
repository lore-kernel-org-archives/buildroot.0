From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:39:14 +0100
Subject: [Buildroot] [git commit] icu: add license informations
Message-ID: <20130120202430.86B1C9A30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13ac891065e4c7295bd4ee12e56a08511e4c8446
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/icu.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 5a2d594..541ca35 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,6 +7,9 @@
 ICU_VERSION = 4.8.1.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
+ICU_LICENSE = ICU License
+ICU_LICENSE_FILES = license.html
+
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:53 -0000
Subject: [Buildroot] [git commit branch/next] icu: remove redundant
	HOST_ICU_DEPENDENCIES
Message-ID: <20120802195249.A033A96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=feb96bb00d5cbda97900b525bba6cbd50b432f20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a2c24ca..42416b7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -8,7 +8,6 @@ ICU_VERSION = 4.8.1.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_DEPENDENCIES = host-icu
-HOST_ICU_DEPENDENCIES =
 ICU_INSTALL_STAGING = YES
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests

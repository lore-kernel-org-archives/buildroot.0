From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Aug 2016 22:00:31 +0200
Subject: [Buildroot] [PATCHv2] package/kmsxx: bump version for portability
	fix with musl
Message-ID: <1470859231-9807-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the version to get two portability patches (as well as a small,
innocuously-looking minor feature).

Fixes:
    http://autobuild.buildroot.net/results/682/68266cb5b26a62387dc99aef31fc9654c8fcd505/
    [and quite a few others...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>

---
Changes v1 -> v2:
  - bump version and drop patches, as they were applied upstream.
---
 package/kmsxx/kmsxx.hash | 2 +-
 package/kmsxx/kmsxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index 4615a65..c7f095f 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 62bd9e8c9686e5624ebeba27234cae956eeec7830a742563f051ee4a2fe522c7  kmsxx-a706f157b86e90696808025db01de99646d51a77.tar.gz
+sha256  01787dd3d3e14b5cfb8b6e8ab3d9623c2db54d21  kmsxx-bd5f6471e619a6ba2987bc7f66ef78a531f94d6c.tar.gz
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index df0ab23..730292e 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
+KMSXX_VERSION = bd5f6471e619a6ba2987bc7f66ef78a531f94d6c
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPLv2.0
 KMSXX_LICENSE_FILES = LICENSE
-- 
2.7.4

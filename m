From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 12 Dec 2019 19:44:39 +0100
Subject: [Buildroot] [PATCH 3/4] package/xenomai: Bump version to 3.0.10
In-Reply-To: <cover.1576176280.git.jan.kiszka@siemens.com>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
Message-ID: <30b25e0bbb143d8a5df7aff5c8caddef094b5afa.1576176280.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 package/xenomai/xenomai.hash | 2 +-
 package/xenomai/xenomai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 83994384eb..31a925f2c4 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256 be7a7a453a8d1f0763ed5feb3bee159fe60b8a42326b0ff564e94184bd4d0734  xenomai-v3.0.9.tar.bz2
+sha256 de72ef7a4522bf9ba5f72a674acac35a92eb38823d3631201a33bea958d9fb7d  xenomai-v3.0.10.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 1d38cffa30..ac823407f2 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = v3.0.9
+XENOMAI_VERSION = v3.0.10
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
-- 
2.16.4

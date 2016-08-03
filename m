From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Aug 2016 11:56:51 +0100
Subject: [Buildroot] [PATCH 2/3] alsa-utils: bump version to 1.1.2
In-Reply-To: <1470221812-32709-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1470221812-32709-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1470221812-32709-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 89eb510..c2c089f 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	89757c9abaf420831b088fce354d492acc170bd02bb50eb7392c175f594b8041	alsa-utils-1.1.1.tar.bz2
+sha256 7af603c0877d1251599d65b4fbc372e63a54371b888f5c26c6a86ac1d0519071  alsa-utils-1.1.2.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index a04d2cb..fc2ac16 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.1
+ALSA_UTILS_VERSION = 1.1.2
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
-- 
2.7.3

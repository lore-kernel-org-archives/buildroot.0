From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Sep 2016 14:40:09 +0100
Subject: [Buildroot] [PATCH 3/6] nano: bump version to 2.7.0
In-Reply-To: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1473082812-690-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 40a6942..fc628eb 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 22f79cc635458e0c0d110d211576f1edc03b112a62d73b914826a46547a6ac27  nano-2.6.2.tar.xz
+sha256 f86af39514ae74e20bef3c29cd01d1090a9aca772a70e9c9f9e70c3d14b39521  nano-2.7.0.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 7800b58..984a5fc 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.6
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION_MAJOR = 2.7
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
-- 
2.7.3

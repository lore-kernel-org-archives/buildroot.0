From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Feb 2017 16:16:12 -0300
Subject: [Buildroot] [PATCH next] grep: bump to version 3.0
Message-ID: <20170215191612.13751-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 326737a..77420ad 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 ad4cc44d23074a1c3a8baae8fbafff2a8c60f38a9a6108f985eef6fbee6dcaeb  grep-2.27.tar.xz
+sha256 e2c81db5056e3e8c5995f0bb5d0d0e1cad1f6f45c3b2fc77b6e81435aed48ab5  grep-3.0.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 7615f30..7468831 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.27
+GREP_VERSION = 3.0
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
2.10.2

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 3 Oct 2016 11:05:45 +0100
Subject: [Buildroot] [PATCH 1/2] grep: bump version to 2.26
Message-ID: <20161003100546.10860-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 409940a..789ceea 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	e21e83bac50450e0d0d61a42c154ee0dceaacdbf4f604ef6e79071cb8e596830	grep-2.25.tar.xz
+sha256 246a8fb37e82aa33d495b07c22fdab994c039ab0f818538eac81b01e78636870  grep-2.26.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index f87e838..a8e124e 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.25
+GREP_VERSION = 2.26
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
2.10.0

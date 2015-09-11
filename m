From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 13:45:32 +0100
Subject: [Buildroot] [PATCH 3/3] gnupg2: bump version to 2.0.29
In-Reply-To: <1441975532-34622-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441975532-34622-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1441975532-34622-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gnupg2/gnupg2.hash |    4 ++--
 package/gnupg2/gnupg2.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 2a2305c..1219338 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q2/000367.html
-sha1	9a1050f72b6c9afe2b4a0a3f2e9dca2abba8e4ef	gnupg-2.0.28.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00001.html
+sha1 87eb0df18f9953675f979405a1af10ab6c5322b3  gnupg-2.0.29.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index ab3a59a..6d279fd 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.28
+GNUPG2_VERSION = 2.0.29
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
-- 
1.7.1

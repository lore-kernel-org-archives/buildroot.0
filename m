From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 10:21:02 +0100
Subject: [Buildroot] [PATCH 2/2] nano: bump version to 2.6.0
In-Reply-To: <1466760062-31676-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466760062-31676-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1466760062-31676-2-git-send-email-Vincent.Riera@imgtec.com>
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
index eb6a9fc..7152f52 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  b2b060129b9feff2d4870d803a441178c96531de9aed144ec0b83bd63ccb12ee  nano-2.5.3.tar.gz
+sha256 d517a5fcaa9fa6ceda8a63e22be1d83dd7f4af13703c73b10a48e95a6e1178d3  nano-2.6.0.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0ed35b9..d8e19bc 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 2.5
-NANO_VERSION = $(NANO_VERSION_MAJOR).3
+NANO_VERSION_MAJOR = 2.6
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-- 
2.7.3

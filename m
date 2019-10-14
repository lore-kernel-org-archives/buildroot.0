From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 04:30:45 -0600
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump to version
 20190918
Message-ID: <20191014103045.27148-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index fbf7109f1d..5d340e627f 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 74ec7415988d40fa53686d994cf8cb27accdbd35c5373c4c3afc2e93372ebba5  intel-microcode-20190618.tar.gz
+sha256 2b6b728d351764dfbf6a9763ac96ae7e04085f382a309fed3abc0118f094c943  intel-microcode-20190918.tar.gz
 sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 74d5b6c5da..a4d4a01f71 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20190618
+INTEL_MICROCODE_VERSION = 20190918
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.20.1

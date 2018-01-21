From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:33 +0100
Subject: [Buildroot] [PATCH 6/8] ljlinenoise: bump to version 0.1.3
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljlinenoise/ljlinenoise.hash | 2 +-
 package/ljlinenoise/ljlinenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
index 7b4a948c5..c70b5d680 100644
--- a/package/ljlinenoise/ljlinenoise.hash
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a5fa2a88d8232bd0f97d3af9aafe780cd855830b42a9ab87c9ae2a5697b044a1  ljlinenoise-0.1.2-1.src.rock
+sha256	7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index edcbdc95d..f021d9381 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJLINENOISE_VERSION = 0.1.2-1
+LJLINENOISE_VERSION = 0.1.3-1
 LJLINENOISE_LICENSE = MIT
 LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
 
-- 
2.11.0

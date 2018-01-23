From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:47 +0100
Subject: [Buildroot] [git commit] ljlinenoise: bump to version 0.1.3
Message-ID: <20180123073700.78EE580426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa97b1eec75154654a16a863325e1ccf8b9fa585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ljlinenoise/ljlinenoise.hash | 2 +-
 package/ljlinenoise/ljlinenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
index 7b4a948..c70b5d6 100644
--- a/package/ljlinenoise/ljlinenoise.hash
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a5fa2a88d8232bd0f97d3af9aafe780cd855830b42a9ab87c9ae2a5697b044a1  ljlinenoise-0.1.2-1.src.rock
+sha256	7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index edcbdc9..f021d93 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJLINENOISE_VERSION = 0.1.2-1
+LJLINENOISE_VERSION = 0.1.3-1
 LJLINENOISE_LICENSE = MIT
 LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
 

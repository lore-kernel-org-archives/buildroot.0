From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Jun 2013 12:12:21 +0200
Subject: [Buildroot] [git commit] linenoise: fix git commit id
Message-ID: <20130608101448.A14649A9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41190ef0f1ffb68675bfe77205e9207363546377
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow a 'g' had sneaked in before the commit id.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linenoise/linenoise.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 01bfa0c..14e0f09 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = g27a3b4d
+LINENOISE_VERSION = 27a3b4d5
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES

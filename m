From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:43:16 +0100
Subject: [Buildroot] [git commit] coreutils: add license information
Message-ID: <20130121225447.22C279A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d12b5b808537fbfa399b8aca4c13313327d1876b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv3+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/coreutils/coreutils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d7d0779..079ec12 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -7,6 +7,8 @@
 COREUTILS_VERSION = 8.18
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
+COREUTILS_LICENSE = GPLv3+
+COREUTILS_LICENSE_FILES = COPYING
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.

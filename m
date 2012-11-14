From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:38:43 +0100
Subject: [Buildroot] [git commit] valgrind: add license info
Message-ID: <20121114214736.C244C99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8768bef793c1ad0e9ffd9f82e0ca0a9cfda27fc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/valgrind/valgrind.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 05f402f..cdebbec 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,6 +7,9 @@
 VALGRIND_VERSION = 3.7.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+VALGRIND_LICENSE = GPLv2 GFDLv1.2
+VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
+
 VALGRIND_CONF_OPT = --disable-tls
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the

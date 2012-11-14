From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:38:55 +0100
Subject: [Buildroot] [git commit] xenomai: add license info
Message-ID: <20121114214737.8E53699B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a5f9293a1195020def8516bfafe8e69bab51a00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xenomai/xenomai.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index e425b75..f40cbdc 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -12,6 +12,9 @@ endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable/
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
+# GFDL is not included but refers to gnu.org
+XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
 
 XENOMAI_INSTALL_STAGING = YES
 

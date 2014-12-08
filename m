From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 18:47:42 +0100
Subject: [Buildroot] [git commit] freetype: CVE-2014-2240: bump version to
	2.5.4
Message-ID: <20141208174749.AC12280149@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03110605a3207d441c57d7e2b00a2fb70a23a597
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See: https://savannah.nongnu.org/bugs/?43661

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.hash |    2 ++
 package/freetype/freetype.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
new file mode 100644
index 0000000..8184eb0
--- /dev/null
+++ b/package/freetype/freetype.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3b4e2c666b33b32ad29ff0fe5c6538e757d3c73368e5dfa88bd59b4bc95cbabb  freetype-2.5.4.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index b85d0ec..c2f7f13 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.3
+FREETYPE_VERSION = 2.5.4
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES

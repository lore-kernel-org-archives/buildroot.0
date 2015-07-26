From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:15:19 +0200
Subject: [Buildroot] [git commit] libllcp: Bump version and change site
Message-ID: <20150726212545.98F257F95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=930976c7dbadcf741354c15e0f2953a56e85cde4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is a closing forge, libllcp has already made the move to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libllcp/libllcp.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index e0dbb83..2c2014a 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
-LIBLLCP_SITE = https://libllcp.googlecode.com/git
-LIBLLCP_SITE_METHOD = git
+LIBLLCP_VERSION = 05dfa8003433a7070bfd8ae02efdb0203bbf34aa
+LIBLLCP_SITE = $(call github,nfc-tools,libllcp,$(LIBLLCP_VERSION))
 LIBLLCP_DEPENDENCIES = host-pkgconf libnfc
 # There's no ./configure in the repository, so we need to autoreconf
 LIBLLCP_AUTORECONF = YES

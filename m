From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:36:24 +0200
Subject: [Buildroot] [git commit] liberation: add license information
Message-ID: <20140701224921.E5ED19D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a50f3206456e2fa2b7bbb016ce4e256350a2953
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liberation/liberation.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index ac387fd..815aeba 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -7,8 +7,10 @@
 LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
-
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
+# Bump to 2.x changes license!!
+LIBERATION_LICENSE = GPLv2 with exceptions
+LIBERATION_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_LIBERATION_MONO),y)
 define LIBERATION_INSTALL_MONO

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 14:50:25 +0100
Subject: [Buildroot] [git commit] package/liberation: fix download site due
	to recent fedorahosted.org closing
Message-ID: <20170310135112.3611F81D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53c07aa3a24d0f0a647e0e6858af5e65c6e81833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liberation/liberation.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index dfed086..a77c014 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBERATION_VERSION = 2.00.1
-LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
+LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFLv1.1

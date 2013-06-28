From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:30:56 +0200
Subject: [Buildroot] [git commit] enchant: define license
Message-ID: <20130628195142.D3B449B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=303f4707d2d413176069d59a72d401b73094feb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/enchant/enchant.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 50a8a6c..8a76c6b 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -9,5 +9,7 @@ ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
+ENCHANT_LICENSE = LGPLv2.1+
+ENCHANT_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))

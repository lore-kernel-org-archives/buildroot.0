From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 16:05:41 +0200
Subject: [Buildroot] [PATCH 4/4] ngrep: add license information
In-Reply-To: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
Message-ID: <1381759541-15243-4-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/ngrep/ngrep.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 99b8f46..e25d3a2 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -7,6 +7,8 @@
 NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
+NGREP_LICENSE = BSD-Style
+NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
 NGREP_CONF_ENV = LDFLAGS="-lpcre"
 NGREP_CONF_OPT =  \
-- 
1.7.10.4

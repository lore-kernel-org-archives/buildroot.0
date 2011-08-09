From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:42 +0200
Subject: [Buildroot] [PATCH 09/22] lzop: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-9-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/lzop/lzop.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 796686a..e55c105 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,7 +6,6 @@
 LZOP_VERSION:=1.02rc1
 LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE:=http://www.lzop.org/download/
-LZOP_CONF_OPT:=--program-prefix=""
 LZOP_DEPENDENCIES:=lzo
 
 $(eval $(call AUTOTARGETS,package,lzop))
-- 
1.7.2.5

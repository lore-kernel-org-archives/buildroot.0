From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:44 +0200
Subject: [Buildroot] [PATCH 11/22] fbdump: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-11-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/fbdump/fbdump.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index eb74d8b..521b0fd 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,7 +7,6 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
-FBDUMP_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,fbdump))
 
-- 
1.7.2.5

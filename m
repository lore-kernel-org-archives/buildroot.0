From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:43 +0200
Subject: [Buildroot] [PATCH 10/22] netcat: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-10-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/netcat/netcat.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index f8263ef..31f6b71 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,6 +10,5 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
-NETCAT_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,netcat))
-- 
1.7.2.5

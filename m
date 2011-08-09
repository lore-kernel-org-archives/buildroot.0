From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:48 +0200
Subject: [Buildroot] [PATCH 15/22] gamin: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-15-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/gamin/gamin.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index d691f60..326fd62 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -9,7 +9,7 @@ GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
 
-GAMIN_CONF_OPT = --program-prefix="" --disable-debug
+GAMIN_CONF_OPT = --disable-debug
 
 # python support broken
 GAMIN_CONF_OPT += --without-python
-- 
1.7.2.5

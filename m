From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:09 -0300
Subject: [Buildroot] [PATCH 12/19] gamin: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gamin/gamin.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 7939992..c7ec531 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -9,7 +9,8 @@ GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
-
+GAMIN_LICENSE = LGPLv2+
+GAMIN_LICENSE_FILES = COPYING
 GAMIN_CONF_OPT = --disable-debug
 
 # python support broken
-- 
1.8.1.5

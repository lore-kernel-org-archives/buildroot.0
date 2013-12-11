From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:49 -0300
Subject: [Buildroot] [PATCH 16/16] aumix: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aumix/aumix.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index de0902a..a55588f 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -8,6 +8,8 @@ AUMIX_VERSION = 2.8
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF = YES
+AUMIX_LICENSE = GPLv2+
+AUMIX_LICENSE_FILES = COPYING
 
 AUMIX_CONF_OPT = \
 	--without-gtk \
-- 
1.8.3.2

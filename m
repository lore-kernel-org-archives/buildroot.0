From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:49 -0300
Subject: [Buildroot] [PATCH 21/53] ipkg: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipkg/ipkg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index b9cba58..10ef207 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -7,5 +7,7 @@
 IPKG_VERSION = 0.99.163
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
+IPKG_LICENSE = GPLv2+
+IPKG_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:12 -0300
Subject: [Buildroot] [PATCH 44/53] rsh-redone: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-44-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsh-redone/rsh-redone.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 6e617c2..9c8a39d 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -7,6 +7,8 @@
 RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
 RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
+RSH_REDONE_LICENSE = GPLv2
+RSH_REDONE_LICENSE_FILES = rsh.c
 
 RSH_REDONE_BINS-y =
 RSH_REDONE_BINS-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
-- 
1.8.5.5

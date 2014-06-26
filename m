From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:42 -0300
Subject: [Buildroot] [PATCH 14/53] genromfs: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/genromfs/genromfs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index c45d1e1..2d50a52 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -6,6 +6,8 @@
 
 GENROMFS_VERSION = 0.5.2
 GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
+GENROMFS_LICENSE = GPLv2+
+GENROMFS_LICENSE_FILES = COPYING
 
 define GENROMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
1.8.5.5

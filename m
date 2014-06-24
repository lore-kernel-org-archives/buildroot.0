From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:43 -0300
Subject: [Buildroot] [PATCH 37/54] squashfs: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-37-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squashfs/squashfs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index aaf568c..58dcb62 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -7,6 +7,8 @@
 SQUASHFS_VERSION = 4.3
 SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_LICENSE = GPLv2+
+SQUASHFS_LICENSE_FILES = COPYING
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
-- 
1.8.5.5

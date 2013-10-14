From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 16:05:38 +0200
Subject: [Buildroot] [PATCH 1/4] mutt: add license information
Message-ID: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/mutt/mutt.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 59f65f6..0c17589 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -6,6 +6,8 @@
 
 MUTT_VERSION = 1.5.21
 MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt-dev
+MUTT_LICENSE = GPLv2+
+MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPT = --disable-iconv --disable-smtp
 MUTT_AUTORECONF = YES
-- 
1.7.10.4

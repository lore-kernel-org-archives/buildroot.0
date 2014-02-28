From: =?ISO-8859-1?Q?L=E9vai_Tam=E1s?= <levai.tamas@t-online.hu>
Date: Fri, 28 Feb 2014 09:01:08 +0100
Subject: [Buildroot] [PATCH] grep: bump version to 2.18
Message-ID: <53104244.8010305@t-online.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tamas Levai <levai.tamas@t-online.hu>
---
  package/grep/grep.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
#
################################################################################

-GREP_VERSION = 2.16
+GREP_VERSION = 2.18
  GREP_SITE = $(BR2_GNU_MIRROR)/grep
  GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
  GREP_LICENSE = GPLv3+

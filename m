From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 2 Mar 2017 17:06:10 +0100
Subject: [Buildroot] [PATCH] package/alsamixergui: add license information
Message-ID: <a0915233-820b-2622-ed75-4ec3ef8e0e7c@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/alsamixergui/alsamixergui.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index dba3ddd..8a1bcfe 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -7,6 +7,8 @@
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
 ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
+ALSAMIXERGUI_LICENSE = GPLv3+
+ALSAMIXERGUI_LICENSE_FILES = COPYING
 ALSAMIXERGUI_AUTORECONF = YES
 
 ALSAMIXERGUI_CONF_ENV = \
-- 
1.9.1

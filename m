From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 3 Mar 2017 12:23:24 +0100
Subject: [Buildroot] [PATCH v2] package/alsamixergui: add license information
Message-ID: <ba9e2b4a-fd01-4fc0-8906-ce40bc18a44c@grandegger.com>
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
index dba3ddd..0d37c8c 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -7,6 +7,8 @@
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
 ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
+ALSAMIXERGUI_LICENSE = GPLv2+
+ALSAMIXERGUI_LICENSE_FILES = debian/copyright
 ALSAMIXERGUI_AUTORECONF = YES
 
 ALSAMIXERGUI_CONF_ENV = \
-- 
1.9.1

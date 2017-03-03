From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 21:49:34 +0100
Subject: [Buildroot] [git commit] package/alsamixergui: add license
	information
Message-ID: <20170303204940.0AF0C822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e87650a198448afe1675015e69c0ef086400e7f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

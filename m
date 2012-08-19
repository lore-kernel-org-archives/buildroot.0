From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:26 -0400
Subject: [Buildroot] [PATCH 4/8] nano: add license info
In-Reply-To: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1345407510-10058-4-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/nano/nano.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 164c7a6..61bf218 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -6,6 +6,8 @@
 
 NANO_VERSION = 2.3.1
 NANO_SITE = http://www.nano-editor.org/dist/v2.3
+NANO_LICENSE = GPLv3+
+NANO_LICENSE_FILES = COPYING
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang
 NANO_DEPENDENCIES = ncurses
-- 
1.7.9.5

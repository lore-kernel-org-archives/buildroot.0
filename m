From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:48:03 +0200
Subject: [Buildroot] [git commit] nano: add license info
Message-ID: <20120821110312.8124597206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87e7661b53b83df870918432481995f8bd9fcd78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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

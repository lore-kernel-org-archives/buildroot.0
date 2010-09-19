From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:39 -0700
Subject: [Buildroot] [PATCH 17/21] nano: bump to 2.2.5
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-18-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/nano/nano.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 47355a3..5e9824b 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NANO_VERSION = 2.2.3
+NANO_VERSION = 2.2.5
 NANO_SITE = http://www.nano-editor.org/dist/v2.2
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang --enable-tiny
-- 
1.7.2.3

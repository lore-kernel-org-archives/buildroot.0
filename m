From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 11:54:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/tmux: set TMUX_CPE_ID_VALID
Message-ID: <20210206105419.1999977-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tmux_project:tmux is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atmux_project%3Atmux

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tmux/tmux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 00e77ad762..17e1da5607 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -8,6 +8,7 @@ TMUX_VERSION = 2.9a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
+TMUX_CPE_ID_VALID = YES
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
 # 0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
-- 
2.29.2

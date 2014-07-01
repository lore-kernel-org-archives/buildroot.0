From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:30:28 +0200
Subject: [Buildroot] [git commit] pcmanfm: add license information
Message-ID: <20140701224922.3627D9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4ae7ab614cb637eaa595e7032ddcc0a3bd35152
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/pcmanfm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 80eedd4..d4636b1 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -9,5 +9,7 @@ PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%2
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
 PCMANFM_AUTORECONF = YES
+PCMANFM_LICENSE = GPLv2+
+PCMANFM_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))

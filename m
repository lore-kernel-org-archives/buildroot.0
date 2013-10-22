From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 15:56:28 +0200
Subject: [Buildroot] [git commit] mutt: add license information
Message-ID: <20131022140318.2B0A49BAF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f355f89c92492c4275373a9bb9ab1e6d0a1dd9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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

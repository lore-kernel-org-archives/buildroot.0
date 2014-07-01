From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:30:55 +0200
Subject: [Buildroot] [git commit] prboom: add license information
Message-ID: <20140701224922.3D6E19D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d559501cdb01e85b6353fae631df7b7282c6d24c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 1da08ce..55973d6 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -8,6 +8,8 @@ PRBOOM_VERSION = 2.5.0
 PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
+PRBOOM_LICENSE = GPLv2+
+PRBOOM_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng

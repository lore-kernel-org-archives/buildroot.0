From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:08 -0300
Subject: [Buildroot] [PATCH 40/53] prboom: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-40-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/prboom/prboom.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5

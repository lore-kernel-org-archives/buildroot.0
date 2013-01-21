From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:49:28 +0100
Subject: [Buildroot] [git commit] haserl: add license information
Message-ID: <20130121225448.1D7149A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9de76455375acc5c3a8660d1d43b3b12f652acba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/haserl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 589b3e7..7627917 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -6,6 +6,8 @@
 
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel/$(HASERL_VERSION)
+HASERL_LICENSE = GPLv2
+HASERL_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \

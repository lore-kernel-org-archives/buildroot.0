From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 17:51:36 +0000
Subject: [Buildroot] [PATCH 2/2] kismet: bump version to Kismet-2014-02-R1
In-Reply-To: <1418320296-6007-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418320296-6007-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418320296-6007-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/kismet/kismet.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 5cb5648..f177fea 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2013-03-R1b
-KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
-KISMET_SITE = http://www.kismetwireless.net/code
+KISMET_VERSION = Kismet-2014-02-R1
+KISMET_SITE = http://www.kismetwireless.net/kismet.git
+KISMET_SITE_METHOD = git
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
-- 
1.7.1

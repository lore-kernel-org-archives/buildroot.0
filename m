From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 21:21:14 +0100
Subject: [Buildroot] [git commit] bmon: bump to version 4.0
Message-ID: <20161218203346.47022818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d174d2ee3744ad73e6458cf1fa7b21fafb1cac19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bmon/bmon.hash | 2 +-
 package/bmon/bmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index 7f28b74..dec0c7d 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c08332520497ef1d51a733ca531ffedbb5a30c7c3f55579efe86c36138f93e1  bmon-3.9.tar.gz
+sha256  02fdc312b8ceeb5786b28bf905f54328f414040ff42f45c83007f24b76cc9f7a  bmon-4.0.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 91993b6..32889a6 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.9
+BMON_VERSION = 4.0
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'

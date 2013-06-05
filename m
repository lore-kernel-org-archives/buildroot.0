From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 11:00:42 +0200
Subject: [Buildroot] [git commit] bwm-ng: move to appropiate category
Message-ID: <20130605090359.015649A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b6af1af6fee511b5565dc3ca791e6ac9458ca15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bwm-ng is a networking application, not a system one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0d4ed90..f26b1aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/chrony/Config.in"
 source "package/connman/Config.in"
@@ -854,7 +855,6 @@ source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
-source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"

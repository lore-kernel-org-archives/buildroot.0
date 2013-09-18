From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:55:39 +0200
Subject: [Buildroot] [git commit] ola: needs host-bison and host-flex
Message-ID: <20130918222318.9997C9B7D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41a9a56fe9cd24a11a58f9c44118dc14201af86c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/385/385f05b5e1b023b6c4ca220aab897e400b5aeccb/
and a future failure (host-bison).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ola/ola.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 55386b1..d7ddab7 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -12,7 +12,7 @@ OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
 
 # util-linux provides uuid lib
-OLA_DEPENDENCIES = protobuf util-linux
+OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
 
 OLA_CONF_OPT = \
 	--disable-gcov \

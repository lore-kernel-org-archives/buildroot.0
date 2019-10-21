From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Oct 2019 20:07:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/asterisk: bump version to 16.6.1
Message-ID: <20191021180722.18851-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.asterisk.org/downloads/asterisk-news/asterisk-1660-now-available
https://www.asterisk.org/downloads/asterisk-news/asterisk-1661-now-available

Updated license hash after upstream commit, no license changes:
https://github.com/asterisk/asterisk/commit/b096389660027365efe893077b24482f84ba31ac

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1184e4333d..4cb4a42e19 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  122ecf242e06da373488024e0c76154f2404d024d09eed20b23cae0795033380  asterisk-16.5.1.tar.gz
+sha256  9323f1fd41416d2d997015b2199d5507847e54da64c2e24923d75f5c283c5e83  asterisk-16.6.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
@@ -11,5 +11,5 @@ sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asteri
 # License files, locally computed
 sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
 sha256  ac5571f00e558e3b7c9b3f13f421b874cc12cf4250c4f70094c71544cf486312  main/sha1.c
-sha256  309462c10e84f46bda22032ebe6359f3e9e3e23afcf1fc2aaed5b59daf800d84  codecs/speex/speex_resampler.h
+sha256  6215e3ed73c3982a5c6701127d681ec0b9f1121ac78a28805bd93f93c3eb84c0  codecs/speex/speex_resampler.h
 sha256  1ca2c7a7a1ae7ccd75212a8c1e85dd9ec92bdbc9170aafd97ea60459387755fd  utils/db1-ast/include/db.h
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 1f3061b450..6f94f628a4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.5.1
+ASTERISK_VERSION = 16.6.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.20.1

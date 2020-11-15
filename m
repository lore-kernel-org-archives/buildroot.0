From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Nov 2020 14:22:29 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/asterisk: bump
 version to 16.13.0
Message-ID: <20201115130930.D142A86301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8524d035ac19ca4d504040281cfb05a6e03f70ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://www.asterisk.org/asterisk-news/asterisk-16-13-0-now-available/
https://www.asterisk.org/asterisk-news/asterisk-16120-now-available/
https://www.asterisk.org/asterisk-news/asterisk-16110-now-available/

Updated license hash due to upstream commit:
https://github.com/asterisk/asterisk/commit/9e7fc210868c200138f41db9dbb2400aad62deec

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14c29ea9d60eff309109044dae95a4fc84bdad68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 50457ba8f5..1bb5da7d06 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f0ba5e3c4ef46f6657dd3a7167190f9b6cd6bbf4af09ecc291a9d5868b477609  asterisk-16.10.0.tar.gz
+sha256  5ebefa6387f89695361b8c105e2ad7ee6381f87a99012aeb85b886ddf6d518ac  asterisk-16.13.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
@@ -12,4 +12,4 @@ sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asteri
 sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
 sha256  ac5571f00e558e3b7c9b3f13f421b874cc12cf4250c4f70094c71544cf486312  main/sha1.c
 sha256  6215e3ed73c3982a5c6701127d681ec0b9f1121ac78a28805bd93f93c3eb84c0  codecs/speex/speex_resampler.h
-sha256  1ca2c7a7a1ae7ccd75212a8c1e85dd9ec92bdbc9170aafd97ea60459387755fd  utils/db1-ast/include/db.h
+sha256  ea69cc96ab8a779c180a362377caeada71926897d1b55b980f04d74ba5aaa388  utils/db1-ast/include/db.h
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 97e97c14c8..eb72104d9a 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.10.0
+ASTERISK_VERSION = 16.13.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:23:26 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/live555: security
 bump to version 2021.05.03
Message-ID: <20210517185730.0D3B47F88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ff560df674b646bb41064495f61adfed343680a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-28899: Vulnerability in the
AC3AudioFileServerMediaSubsession, ADTSAudioFileServerMediaSubsession,
and AMRAudioFileServerMediaSubsessionLive OnDemandServerMediaSubsession
subclasses in Networks LIVE555 Streaming Media before 2021.3.16.

http://live555.com/liveMedia/public/changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6ad1c7f12e57ab7c6f022470e0aacec442d14267)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 5e65cacd7b..d4fa93d029 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  4645d2a0c865505c85b48af5317bcb4a  live.2020.08.19.tar.gz
+md5  3c1992b0e9b871bcad7491a3da541781  live.2021.05.03.tar.gz
 # Locally generated
-sha256  af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537  live.2020.08.19.tar.gz
+sha256  ae73241f9cc4ab740d60737c0438d62a7635af3822de5d84acf275793de42029  live.2021.05.03.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 9a5c1c7c0d..effd4517cf 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2020.08.19
+LIVE555_VERSION = 2021.05.03
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 # There is a COPYING file with the GPL-3.0 license text, but none of

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 09:22:45 +0100
Subject: [Buildroot] [git commit] package/dejavu: add hashes from project
	site
Message-ID: <20141203082334.A288580057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=435e95d809ae346b8b995000a1894adcf8048baf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop locally computed sha1sum]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dejavu/dejavu.hash |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
index 11e0d1c..df851d7 100644
--- a/package/dejavu/dejavu.hash
+++ b/package/dejavu/dejavu.hash
@@ -1,2 +1,3 @@
-# Locally computed
-sha1 33fa825aa1dd44ce23a11af92b3078e978ff513d dejavu-fonts-ttf-2.34.tar.bz2
+# From http://dejavu-fonts.org/wiki/Download
+md5 161462de16e2ca79873bc2b0d2e6c74c dejavu-fonts-ttf-2.34.tar.bz2
+sha256 d0a72c3ae99f5b8d7470daf091ec43f78dc942795aed5c996ab1aa678702eb5d dejavu-fonts-ttf-2.34.tar.bz2

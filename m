From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:23:26 +0200
Subject: [Buildroot] [git commit] arc: Add arc, arcbe to gnuconfig
Message-ID: <20130504212452.5913D99ABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=297e4b510ef9ea93965e2c42bc05885e18bc70aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/gnuconfig/config.sub |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 8509813..b2958ad 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -259,7 +259,7 @@ case $basic_machine in
 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
 	| am33_2.0 \
-	| arc \
+	| arc | arceb \
 	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv7[arm] \
 	| avr | avr32 \
 	| be32 | be64 \
@@ -372,7 +372,7 @@ case $basic_machine in
 	| aarch64-* | aarch64_be-* \
 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
-	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
 	| avr-* | avr32-* \
 	| be32-* | be64-* \

From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 12:13:15 +0200
Subject: [Buildroot] [PATCH v2 04/12] arc: Add arc, arcbe to gnuconfig
In-Reply-To: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366798403-6984-5-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
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
-- 
1.7.0.4

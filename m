From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:52 +0200
Subject: [Buildroot] [git commit branch/next] support/gnuconfig/config.sub:
 add C-SKY support
Message-ID: <20190531210133.742918D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2213636675b061732da0dbcfc80b55cdcd310666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Modify config.sub so that it knows about the C-SKY
architecture. Without this, all autotools projects fail to build on
C-SKY.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
[Thomas: improved commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/gnuconfig/config.sub | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 6d86a1e2f7..45dd0a7d04 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -254,6 +254,7 @@ case $basic_machine in
 	| arc | arceb \
 	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv7[arm] \
 	| avr | avr32 \
+	| csky \
 	| ba \
 	| be32 | be64 \
 	| bfin \
@@ -376,6 +377,7 @@ case $basic_machine in
 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
 	| avr-* | avr32-* \
+	| csky-* \
 	| ba-* \
 	| be32-* | be64-* \
 	| bfin-* | bs2000-* \

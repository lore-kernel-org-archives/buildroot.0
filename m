From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:34 +0800
Subject: [Buildroot] [PATCH V2 8/9] support/config.sub: Add C-SKY support
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <1557305915-11247-8-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Enable gnuconfig for C-SKY Architecutre compiling.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 support/gnuconfig/config.sub | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 6d86a1e..45dd0a7 100755
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
-- 
2.7.4

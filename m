From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:55:47 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] support/gnuconfig:
 reference the correct sha1 we're using
Message-ID: <20200510203114.54F6E913C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b31a049b15cbefff86f5dd9b4a9ea9370ff3ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In commit ff9f778c66f4 (support/gnuconfig: update to 2019-05-28), we
forgot to update the README to reference the sha1 we're using, keeping
the old one from 2016...

Update it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3bf545da78b831339f5f717dfb4d120d46ecd929)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/gnuconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index 7ba2a332a4..7e7d49830f 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -24,4 +24,4 @@ Currently no patches are needed, but they may be needed again in the
 future.
 
 The current Buildroot version is based on the Git commit
-dafd8e767ec87b90aac62f0fcedd11944c84b50a of the config.git repository.
+104ee6463c4bfaac3f3029d9be9bdd6e93879323 of the config.git repository.

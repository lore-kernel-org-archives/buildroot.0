From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 May 2020 13:00:37 +0200
Subject: [Buildroot] [PATCH 1/3] support/gnuconfig: reference the correct
 sha1 we're using
In-Reply-To: <cover.1589022016.git.yann.morin.1998@free.fr>
References: <cover.1589022016.git.yann.morin.1998@free.fr>
Message-ID: <83dc2de9afe3e5196ef6a2b033e19e44ae6154c4.1589022016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit ff9f778c66f4 (support/gnuconfig: update to 2019-05-28), we
forgot to update the README to reference the sha1 we're using, keeping
the old one from 2016...

Update it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.20.1

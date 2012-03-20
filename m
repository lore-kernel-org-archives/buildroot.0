From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:58 +0100
Subject: [Buildroot] [PATCH 08/11] manual: rework the intro of
	customize-rootfs.txt
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332285001-12881-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/customize-rootfs.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 123c97f..d067e31 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -2,7 +2,9 @@
 Customizing the generated target filesystem
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-There are a few ways to customize the resulting target filesystem:
+Apart changing one or another configuration through +make
+*-menuconfig+, there are a few ways to customize the resulting target
+filesystem:
 
 * Customize the target filesystem directly and rebuild the image.  The
   target filesystem is available under +output/target/+.  You can
-- 
1.7.9.4

From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:38:17 +0200
Subject: [Buildroot] [PATCH v2 07/11] manual: rework the intro of
	customize-rootfs.txt
In-Reply-To: <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336905501-9757-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel MARTIN <s.martin49@gmail.com>


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

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
1.7.10.2

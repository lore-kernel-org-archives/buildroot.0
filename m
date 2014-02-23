From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:37 +0100
Subject: [Buildroot] [PATCH 11/13] docs/manual: refresh informations about
	*-menuconfig targets
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/make-tips.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 0159ffe..faf59f2 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -32,10 +32,12 @@ The result of the search shows the help message of the matching items.
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
+* +busybox-menuconfig+ and +busybox-savedefconfig+ ony work when
+  +busybox+ is enabled;
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
   +linux+ is enabled;
-* +uclibc-menuconfig+ is only available when the
-  Buildroot internal toolchain backend is used;
+* +uclibc-menuconfig+ is only available when the uClibc C library is
+  selected in the internal toolchain backend;
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
 
-- 
1.8.3.2

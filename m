From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:25 +0200
Subject: [Buildroot] [PATCH 7/7] DEVELOPERS: update my watchlist
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-8-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update my watchlist with SELinux related files.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 DEVELOPERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9352d891d35d..904b35984b0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -254,7 +254,14 @@ N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
 
 N:	Antoine T?nart <antoine.tenart@bootlin.com>
+F:	configs/qemu_x86_64_selinux_defconfig
+F:	package/libselinux/
+F:	package/refpolicy/
 F:	package/wf111/
+F:	support/testing/tests/boot/test_selinux/
+F:	support/testing/tests/boot/test_selinux.py
+F:	support/testing/tests/core/test_selinux/
+F:	support/testing/tests/core/test_selinux.py
 
 N:	Antony Pavlov <antonynpavlov@gmail.com>
 F:	package/lsscsi/
-- 
2.26.2

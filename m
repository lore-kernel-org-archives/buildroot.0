From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:02 +0200
Subject: [Buildroot] [PATCH 01/11] package/libsysfs: add license hashes
Message-ID: <20190729181212.10341-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsysfs/libsysfs.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsysfs/libsysfs.hash b/package/libsysfs/libsysfs.hash
index c419ed95d8..5d32300ad1 100644
--- a/package/libsysfs/libsysfs.hash
+++ b/package/libsysfs/libsysfs.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a  sysfsutils-2.1.0.tar.gz
+sha256  88ced477f0659c5a4df22df3b65de2f12ea3a9c7b5e4750fdc757bc11e97aa79  cmd/GPL
+sha256  4eb1c0ea980e7e4c7fac34e025be0423f5e7ca7df501e1da7ef31f32f14d6cf9  lib/LGPL
-- 
2.20.1
